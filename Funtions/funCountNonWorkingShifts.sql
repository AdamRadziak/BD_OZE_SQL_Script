USE [Fullstack_2023_AR]
GO
/****** Object:  UserDefinedFunction [dbo].[CountNonWorkingShifts]    Script Date: 21.02.2024 15:26:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER FUNCTION [dbo].[CountNonWorkingShifts] (
    @startdate DATETIME,
    @enddate DATETIME
)
RETURNS INT
AS
BEGIN
    DECLARE @nonWorkingShifts INT, @getDate datetime;
	-- if date is null
	IF @startdate IS NULL 
		SET @startdate=GETDATE() 
	IF @enddate IS NULL
		SET @enddate=GETDATE() 
    
	SET @nonWorkingShifts = (
       SELECT COUNT(*) 
        FROM (
SELECT CONVERT(datetime, DateColumn) AS ShiftDate
            FROM (
                SELECT DATEADD(HOUR, number * 8,@startdate) AS DateColumn
                FROM master..spt_values 
                WHERE number BETWEEN 0 AND DATEDIFF(HOUR, @startdate, @enddate) /8  AND type='P'
            ) AS Shifts
			WHERE DATEPART(WEEKDAY, DateColumn) BETWEEN 2 AND 6 -- Poprawiono nazwę kolumny na DateColumn
        ) AS WorkingDays
		WHERE (DATEPART(WEEKDAY,ShiftDate)<>1) 
		OR NOT (DATEPART(WEEKDAY,ShiftDate)=7 AND DATEPART(HOUR,ShiftDate) > 6)
		OR NOT (DATEPART(WEEKDAY,ShiftDate)=2 AND DATEPART(HOUR,ShiftDate) < 6)
		)
    RETURN @nonWorkingShifts;
END;
