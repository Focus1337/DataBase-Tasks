use materialsdb

GO
CREATE FUNCTION GetMaterialsSumFunc (
@material NVARCHAR(30))
RETURNS decimal(19,4)
AS
BEGIN
	RETURN (SELECT sum(price * c.consumption)
	FROM Materials m join MaterialsConsumption c on m.mat_code = c.mat_code
	WHERE m.name = @material and
	c.consumption > 5)
END
GO

GO
CREATE FUNCTION GetMaterialStatsTableFunc (
@material NVARCHAR(30))
RETURNS TABLE AS
	RETURN (SELECT m.name, c.consumption, m.unit, m.price
	FROM Materials m join MaterialsConsumption c on m.mat_code = c.mat_code
	WHERE m.name = @material)
GO