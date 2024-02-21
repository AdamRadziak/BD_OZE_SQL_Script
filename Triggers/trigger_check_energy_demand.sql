USE [Fullstack_2023_AR]
GO
/****** Object:  Trigger [dbo].[check_if_fail_device_decrease_production_energy]    Script Date: 20.02.2024 20:02:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- check if this trigger exist if exist drop trigger
IF EXISTS ( SELECT * FROM sys.objects WHERE [name] = '[dbo].[check_if_fail_device_decrease_production_energy]' AND [type] = 'TR' )
	DROP TRIGGER  [dbo].[check_if_fail_device_decrease_production_energy] ;
GO
CREATE TRIGGER [dbo].[check_if_fail_device_decrease_production_energy] ON [dbo].[Dev_Statuses]
FOR UPDATE, INSERT 
AS
-- check if failure in device decrease production of energy demand by user
    IF EXISTS (
        SELECT  
            R.Name,
            SUM(D.MaxEnergyProduced) as Available_energy_prod
            ,SUM(OD.EnergyDemand) as Energy_demand
			,CASE
				WHEN dbo.Is_Energy_Prod_More_than_Energy_Demand(SUM(D.MaxEnergyProduced), SUM(OD.EnergyDemand)) = 'False' THEN 'True'
			END AS ProductionEnergyDangered
        FROM Devices D
        JOIN Dev_Statuses DS ON D.IdDeviceStatus = DS.IdDeviceStatus
        JOIN Regions R ON R.IdDevice = D.IdDevice
        JOIN RegionOrders RO ON R.IdRegion = RO.IdRegion
        JOIN OrderDetails OD ON OD.IdRO = RO.IdRegionOrders
        JOIN OrderStatuses OS ON OS.IdOrdDet = OD.IdOD
        JOIN Statuses S ON S.IdStatus = OS.IdStatus
        WHERE DS.StatusName > 0
            AND RO.IdRegion = R.IdRegion
            AND S.OrderStatusName = 'Order accepted'
        GROUP BY R.Name
    )
    BEGIN
        RAISERROR('Energy production is dangered', 16, 1)
		-- return table with regions and energy produced
		select
		R.Name
		, SUM(D.MaxEnergyProduced) as Available_energy_prod
		, SUM(OD.EnergyDemand) as Energy_demand
		, dbo.Is_Energy_Prod_More_than_Energy_Demand(SUM(D.MaxEnergyProduced),SUM(OD.EnergyDemand)) as Is_Order_possible_to_implement
		from Devices D
		join Dev_Statuses DS on D.IdDeviceStatus=DS.IdDeviceStatus
		join Regions R on R.IdDevice=D.IdDevice
		join RegionOrders RO on R.IdRegion=RO.IdRegion
		join OrderDetails OD on OD.IdRO=RO.IdRegionOrders
		WHERE DS.StatusName = 0 AND RO.IdRegion=R.IdRegion
		GROUP BY R.Name
    END;
GO
