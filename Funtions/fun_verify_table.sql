USE [Fullstack_2023_AR]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_VerifyDate]    Script Date: 22.02.2024 16:30:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER FUNCTION [dbo].[fn_VerifyDate] (@beginDate datetime, @endDate datetime ) 
RETURNS TABLE AS RETURN( 
SELECT * FROM Failures  
WHERE  StartDate BETWEEN @beginDate AND @endDate OR  
EndDate BETWEEN @beginDate AND @endDate OR  
StartDate <= @endDate AND EndDate IS NULL
)

