CREATE FUNCTION Is_Energy_Prod_More_than_Energy_Demand(@EnergyProd int, @EnergyDemand int)
RETURNS VARCHAR(10)
AS
BEGIN
	DECLARE @Result varchar(10);
	IF @EnergyProd >= @EnergyDemand
		SET @Result='True';
	ELSE
		SET @Result='False';

	Return @Result;
END
