USE [Fullstack_2023_AR]
GO
/****** Object:  Trigger [dbo].[check_if_fail_device_decrease_production_energy]    Script Date: 21.02.2024 18:21:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TRIGGER [dbo].[check_if_fail_device_decrease_production_energy] ON [dbo].[Dev_Statuses]
FOR UPDATE, INSERT 
AS
BEGIN
	SET NOCOUNT ON;
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
            AND S.OrderStatusName = 'Accepted'
        GROUP BY R.Name
    )
		-- insert logs into table ErrorLogs
		INSERT INTO dbo.ErrorLogs(Msg,LogDate)
		VALUES('Energy production is dangered', GETDATE())
    END;
