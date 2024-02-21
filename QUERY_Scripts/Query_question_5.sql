-- create function to print stop period of device with device name
-- create temporary table
CREATE TABLE #Failures2 (
    IdFailure int,
    IdService int,
    StartDate datetime,
    EndDate datetime
);

-- insert into temp table values from Failures2
INSERT INTO #Failures2(IdFailure,IdService,StartDate,EndDate)
SELECT * FROM dbo.fn_VerifyDate('2024/01/10','2024/02/15')
-- join #Failures2 table with devices table
select
  #Failures2.IdFailure,
  #Failures2.StartDate as fail_date,
  #Failures2.EndDate as repair_date,
  dbo.fn_CountWeekdays(#Failures2.StartDate,#Failures2.EndDate) as stop_period_days,
  Devices.Name as Name_dev
  from #Failures2
  join Dev_Statuses on Dev_Statuses.IdFailure = #Failures2.IdFailure
  join Devices on Dev_Statuses.IdDeviceStatus = Devices.IdDeviceStatus
  -- sum of all devices
  select
  --#Failures2.IdFailure,
  --#Failures2.StartDate as fail_date,
  --#Failures2.EndDate as repair_date,
  SUM(dbo.fn_CountWeekdays(#Failures2.StartDate,#Failures2.EndDate)) as sum_stop_period_days,
  Count(Devices.Name) as Dev_count
  from #Failures2
  join Dev_Statuses on Dev_Statuses.IdFailure = #Failures2.IdFailure
  join Devices on Dev_Statuses.IdDeviceStatus = Devices.IdDeviceStatus


DROP TABLE #Failures2