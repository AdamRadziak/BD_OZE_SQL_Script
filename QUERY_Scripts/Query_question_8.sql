select 
dbo.Return_Failure_devices() as failure_dev_count
, COUNT(D.IdDeviceStatus) as dev_count
,CAST(CAST(dbo.Return_Failure_devices() AS NUMERIC(18,2))/CAST(count(D.IdDevice) AS NUMERIC(18,2)) * 100 AS NUMERIC(18,2)) AS per_failure_dev
from Dev_Statuses as DS
join Devices D on DS.IdDeviceStatus=D.IdDeviceStatus 
WHERE DS.IdDeviceStatus >=0

