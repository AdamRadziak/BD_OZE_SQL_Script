
  select
  Failures.IdFailure,
  Failures.StartDate as fail_date,
  Failures.EndDate as repair_date,

  Devices.Name as Name_dev,
  dbo.get_failure_shift(StartDate) as fail_shift,
  dbo.get_failure_shift(EndDate) as repair_shift
  from Failures
  join Dev_Statuses on Dev_Statuses.IdFailure = Failures.IdFailure
  join Devices on Dev_Statuses.IdDeviceStatus = Devices.IdDeviceStatus


