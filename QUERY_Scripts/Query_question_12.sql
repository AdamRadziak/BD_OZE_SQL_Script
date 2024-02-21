--example of using trigger
UPDATE Dev_Statuses
Set StatusName=0

Select * from Dev_Statuses
ORDER BY IdFailure
Select *  from ErrorLogs

UPDATE Dev_Statuses
Set StatusName=3
WHERE IdFailure BETWEEN 7 AND 9
Select *  from ErrorLogs
--delete  from ErrorLogs