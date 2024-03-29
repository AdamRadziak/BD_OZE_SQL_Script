USE [Fullstack_2023_AR]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_CountWeekdays]    Script Date: 22.02.2024 17:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- funkcja która oblicza różnicę dat nie uwzględniając sobot i niedziel
ALTER FUNCTION [dbo].[fn_CountWeekdays] (@StartDate DATETIME, @EndDate DATETIME)
RETURNS INT
AS
BEGIN
    DECLARE @Result INT, @BeginDate datetime, @Lastdate datetime;
	-- if startDate or End date is null get actual date
	IF (@StartDate IS NULL AND @EndDate IS NOT NULL)
		SET @BeginDate = GETDATE();
		SET @Lastdate = @EndDate;
	IF (@EndDate IS NULL AND @StartDate IS NOT NULL)
		SET @Lastdate = GETDATE();
		SET @BeginDate = @StartDate;
	IF (@EndDate IS NOT NULL AND @StartDate IS NOT NULL)
		SET @BeginDate = @StartDate;
		SET @Lastdate = @EndDate;
	IF (@EndDate IS NULL AND @StartDate IS NULL)
		SET @BeginDate = GETDATE();
		SET @Lastdate = GETDATE();

    WITH AllDays AS (
        SELECT @BeginDate AS [Date]
        UNION ALL
        SELECT DATEADD(DAY, 1, [Date])
        FROM AllDays
        WHERE DATEADD(DAY, 1, [Date]) <= @Lastdate
    )
    SELECT @Result = (COUNT(*) - 1)
    FROM AllDays
    WHERE DATEPART(WEEKDAY, [Date]) NOT IN (1, 7);

    RETURN @Result;
END;