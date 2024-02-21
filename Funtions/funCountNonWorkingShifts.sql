USE [Fullstack_2023_AR]
GO
/****** Object:  UserDefinedFunction [dbo].[CountNonWorkingShifts]    Script Date: 21.02.2024 14:25:58 ******/
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
    DECLARE @nonWorkingShifts INT;

    SET @nonWorkingShifts = (
        SELECT COUNT(*) 
        FROM (
            SELECT CONVERT(DATE, DateColumn) AS ShiftDate
            FROM (
                SELECT DATEADD(HOUR, number * 8, @startdate) AS DateColumn
                FROM master..spt_values
                WHERE type = 'P' AND number BETWEEN 0 AND DATEDIFF(HOUR, @startdate, @enddate) / 8
            ) AS Shifts
            WHERE DATEPART(WEEKDAY, DateColumn) BETWEEN 2 AND 6 -- Poprawiono nazwę kolumny na DateColumn
        ) AS WorkingDays
        WHERE NOT EXISTS (
            SELECT 1
            FROM (
                SELECT '06:00' AS StartTime, '14:00' AS EndTime
                UNION ALL
                SELECT '14:00', '22:00'
                UNION ALL
                SELECT '22:00', '06:00'
            ) AS Shifts
            WHERE 
                (ShiftDate = @startdate AND CAST('06:00' AS TIME(0)) < CAST(@enddate AS TIME(0))) OR
                (ShiftDate = @enddate AND CAST('06:00' AS TIME(0)) > CAST(@startdate AS TIME(0))) OR
                (ShiftDate > @startdate AND ShiftDate < @enddate)
        )
    );

    RETURN @nonWorkingShifts;
END;
