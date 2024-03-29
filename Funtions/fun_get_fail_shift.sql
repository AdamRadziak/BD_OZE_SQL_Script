USE [Fullstack_2023_AR]
GO
/****** Object:  UserDefinedFunction [dbo].[get_failure_shift]    Script Date: 21.02.2024 15:17:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- question 1 - In which shift device failure
ALTER FUNCTION [dbo].[get_failure_shift](@startdate datetime)
RETURNS varchar(20)
AS
BEGIN
	DECLARE @Shift1Start time, @Shift2Start time, @Shift3Start time, @getTime time, @msg varchar(20);
	SET @Shift1Start='06:00:00'
	SET @Shift2Start='14:00:00'
	SET @Shift3Start='22:00:00'
	-- if date is null
	IF @startdate IS NULL
		SET @getTime=CAST(GETDATE() as time(0));
	ELSE
		SET @getTime=CAST(@startdate as time(0));

	-- IF start hour for first shift
	IF (DATEPART(dw,@startdate) < 7 and DATEPART(dw,@startdate) > 1 and @getTime >= @Shift1Start and @getTime < @Shift2Start)
		SET @msg ='1 shift';
	-- if start hours for 2 shift
	IF  (DATEPART(dw,@startdate) < 7 and DATEPART(dw,@startdate) > 1 and @getTime >= @Shift2Start and @getTime < @Shift3Start)
		SET @msg ='2 shift';
	-- if start hours for 3 lift
	IF  (DATEPART(dw,@startdate) > 1 and DATEPART(dw,@startdate) < 7 and @getTime >= @Shift3Start) 
		SET @msg ='3 shift';
	IF (DATEPART(dw,@startdate) between 3 and 6 and @getTime < @Shift1Start)
		SET @msg ='3 shift';	
	IF (DATEPART(dw,@startdate) = 7 and @getTime < @Shift1Start)
		SET @msg ='3 shift';
	IF (DATEPART(dw,@startdate) = 2 and @getTime < @Shift1Start)
		SET @msg = 'No working';
	IF (DATEPART(dw,@startdate) = 1)
		SET @msg = 'No working';
	IF (DATEPART(dw,@startdate) = 7 and @getTime >= @Shift1Start)
		SET @msg = 'No working';

	RETURN @msg
END