SELECT  R.Name, SUM(dbo.returnDateDiff(F.StartDate, F.EndDate)) AS TotalDowntime
FROM [dbo].[Failures] F
JOIN [dbo].[Dev_Statuses] DS ON F.IdFailure = DS.IdFailure
JOIN [dbo].[Devices] D ON DS.IdDeviceStatus = D.IdDeviceStatus
JOIN [dbo].[Regions] R ON D.IdDevice = R.IdDevice
WHERE YEAR(F.StartDate) = 2024 AND YEAR(F.EndDate) = 2024
GROUP BY R.Name
ORDER BY TotalDowntime DESC;




