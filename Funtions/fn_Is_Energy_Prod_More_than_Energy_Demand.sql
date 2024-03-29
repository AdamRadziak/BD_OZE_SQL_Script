USE [Fullstack_2023_AR]
GO
/****** Object:  UserDefinedFunction [dbo].[Is_Energy_Prod_More_than_Energy_Demand]    Script Date: 22.02.2024 15:04:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER FUNCTION [dbo].[Is_Energy_Prod_More_than_Energy_Demand](@EnergyProd int, @EnergyDemand int, @Status int)
RETURNS VARCHAR(10)
AS
BEGIN
	DECLARE @Result varchar(10);
	-- if status of device is more than 0 and EnergyProd is more than energyDmeand
	IF @EnergyProd >= @EnergyDemand AND @Status=0
		SET @Result='True';
	ELSE
		SET @Result='False';

	Return @Result;
END
