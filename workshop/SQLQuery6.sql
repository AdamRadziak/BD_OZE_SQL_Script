SELECT TOP (1000) [IdDeviceStatus]
      ,[IdFailure]
      ,[StatusName]
      ,[StatusDescription]
  FROM [Fullstack_2023_AR].[dbo].[Dev_Statuses]
  select * from Failures
  select * from Statuses
  select * from OrderStatuses
  select 
  OD.EnergyDemand
  , R.Name
  ,S.OrderStatusName
  from OrderDetails OD
  join RegionOrders RO on RO.IdRegionOrders = OD.IdRO
  join Regions R on RO.IdRegion= R.IdRegion
  join OrderStatuses OS on OS.IdOrdDet = OD.IdOD
  join Statuses S on S.IdStatus= OS.IdStatus
  WHERE S.OrderStatusName='Accepted'

  update Dev_Statuses
  set StatusName=0, StatusDescription='Normal Run'
  WHERE IdFailure BETWEEN 1 AND 3
  BEGIN TRANSACTION
    update Dev_Statuses
  set StatusName=1, StatusDescription='In Service'
    WHERE IdFailure BETWEEN 7 AND 9

  --ROLLBACK TRANSACTION

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
        WHERE DS.StatusName = 0
            AND RO.IdRegion = R.IdRegion
            AND S.OrderStatusName = 'Order accepted'
        GROUP BY R.Name