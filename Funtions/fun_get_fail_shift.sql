USE [Fullstack_2023_AR]
GO
/****** Object:  UserDefinedFunction [dbo].[get_failure_shift]    Script Date: 15.02.2024 15:52:39 ******/
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
	SET @Shift1Start='06:00:01'
	SET @Shift2Start='14:00:01'
	SET @Shift3Start='22:00:01'
	SET @getTime=CAST(@startdate as time(0))

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