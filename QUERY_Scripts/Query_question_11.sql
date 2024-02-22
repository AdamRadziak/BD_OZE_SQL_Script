select
R.Name
, DS.StatusName
, COUNT(D.Name) as Dev_count
, SUM(D.MaxEnergyProduced) as Available_energy_prod
, SUM(OD.EnergyDemand) as Energy_demand
, dbo.Is_Energy_Prod_More_than_Energy_Demand(SUM(D.MaxEnergyProduced),SUM(OD.EnergyDemand),DS.StatusName) as Is_Order_possible_to_implement
from Devices D
join Dev_Statuses DS on D.IdDeviceStatus=DS.IdDeviceStatus
join Regions R on R.IdDevice=D.IdDevice
join RegionOrders RO on R.IdRegion=RO.IdRegion
join OrderDetails OD on OD.IdRO=RO.IdRegionOrders
WHERE RO.IdRegion=R.IdRegion
GROUP BY DS.StatusName, R.Name


