Select
D.Name as DevName
,DS.StatusName as DevStatus
, DS.StatusDescription as DevStatusDesc
, F.StartDate as FailDate
, F.EndDate as RepairDate
, dbo.CountNonWorkingShifts(F.StartDate,F.EndDate) as FailShiftCount
FROM Devices D
join Dev_Statuses DS on DS.IdDeviceStatus=D.IdDeviceStatus
join Failures F on F.IdFailure=DS.IdFailure

        