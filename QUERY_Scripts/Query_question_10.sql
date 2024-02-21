select
R.Name
,COUNT(S.OrderStatusName) as Status_count
from Regions R
join RegionOrders RO on RO.IdRegion=R.IdRegion
join OrderDetails OD on OD.IdRO=RO.IdRegionOrders
join OrderStatuses OS on OS.IdOrdDet=OD.IdOD
join Statuses S on S.IdStatus=OS.IdStatus
WHERE S.OrderStatusName='Processing'
GROUP BY R.Name
ORDER BY Status_count DESC

