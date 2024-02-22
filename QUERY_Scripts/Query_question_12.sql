--example of using trigger
UPDATE Dev_Statuses
Set StatusName=1
WHERE IdFailure BETWEEN 12 AND 13

Select * from Dev_Statuses
ORDER BY IdFailure
Select *  from ErrorLogs
--reset to default
UPDATE Dev_Statuses
Set StatusName=0
WHERE IdFailure BETWEEN 12 AND 13
Select * from Dev_Statuses
ORDER BY IdFailure
Select *  from ErrorLogs
