
USE [Fullstack_2023_AR]
GO
IF EXISTS (SELECT * FROM #Failures3)
	DROP TABLE #Failures3

GO
CREATE TABLE #Failures3(
	[FailureId] [int] IDENTITY(1,1) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] 
)
GO

INSERT INTO #Failures3(StartDate,EndDate) VALUES ('2024/01/14','2024/01/17');
INSERT INTO #Failures3(StartDate,EndDate) VALUES ('2024/01/16','2024/01/20');
INSERT INTO #Failures3(StartDate,EndDate) VALUES ('2024/01/16','2024/01/19');
INSERT INTO #Failures3(StartDate,EndDate) VALUES ('2024/01/13','2024/02/20');
INSERT INTO #Failures3(StartDate,EndDate) VALUES ('2024/01/13',NULL);
INSERT INTO #Failures3(StartDate,EndDate) VALUES ('2024/02/13','2024/02/17');
INSERT INTO #Failures3(StartDate,EndDate) VALUES ('2024/02/13',NULL);
SELECT * FROM #Failures3

ALTER FUNCTION fn_VerifyDate ( @beginDate AS DATETIME, @endDate AS DATETIME ) 
RETURNS TABLE AS RETURN( 
SELECT * FROM Failures3  
WHERE  datefirst >= @beginDate OR  
datelast  <= @endDate OR  
(@endDate <= datelast AND @endDate > datefirst)  OR  
(@beginDate >= datefirst AND @beginDate < datelast) OR  
(@beginDate >= datefirst AND datelast IS NULL))

SELECT * FROM dbo.fn_VerifyDate('2024/01/15','2024/02/15')
