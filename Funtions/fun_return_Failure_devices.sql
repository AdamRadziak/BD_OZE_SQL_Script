USE [Fullstack_2023_AR]
GO
/****** Object:  UserDefinedFunction [dbo].[Return_Failure_devices]    Script Date: 22.02.2024 16:29:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER FUNCTION [dbo].[Return_Failure_devices]()
RETURNS INT
AS
BEGIN

	DECLARE @RESULT int;
	select @RESULT=COUNT(*)
	from Devices AS D
	join Dev_Statuses DS on DS.IdDeviceStatus=D.IdDeviceStatus
	WHERE DS.StatusName > 0
	RETURN @RESULT;
END