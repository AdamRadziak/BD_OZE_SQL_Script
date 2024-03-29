USE [Fullstack_2023_AR]
GO
/****** Object:  Trigger [dbo].[check_if_fail_device_decrease_production_energy]    Script Date: 22.02.2024 14:37:49 ******/
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
            R.Name
			, DS.StatusName
            ,SUM(D.MaxEnergyProduced) as Available_energy_prod
            ,SUM(OD.EnergyDemand) as Energy_demand
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
        GROUP BY R.Name, DS.StatusName
		HAVING dbo.Is_Energy_Prod_More_than_Energy_Demand(SUM(D.MaxEnergyProduced), SUM(OD.EnergyDemand),DS.StatusName) = 'False'
    )
	BEGIN
        RAISERROR('Energy production is dangered', 10, 1)
		-- create table with error
		INSERT INTO dbo.ErrorLogs(ErrorCode,Priority,Msg,LogDate)
		VALUES(303,5,'Energy production is dangered', GETDATE())
	END
    END;
