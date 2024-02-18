/*SELECT DATEDIFF("DAY",StartDate,EndDate)
FROM dbo.Failures*/
	CREATE FUNCTION returnDateDiff(@date1 DATETIME, @date2 DATETIME)
	RETURNS INT
	AS
		BEGIN
			DECLARE @wynik INT
			SELECT @wynik = DATEDIFF("DAY",@date1, @date2)
			RETURN @wynik
		END
	