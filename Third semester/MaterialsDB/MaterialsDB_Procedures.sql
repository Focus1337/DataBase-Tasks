use materialsdb
GO
CREATE PROCEDURE DeleteMaterial
@mat_code int
AS
BEGIN
	DELETE FROM MaterialsConsumption
	WHERE mat_code = @mat_code
	DELETE FROM Materials
	WHERE mat_code = @mat_code;
END
GO


GO
CREATE PROCEDURE CreateMaterial
	@mat_code INT OUTPUT,
	@name NVARCHAR(30),
	@unit NVARCHAR(5) = 'רע',
	@price DECIMAL(19,4)
AS
BEGIN
    INSERT INTO Materials(name, unit, price)
    VALUES(@name, @unit, @price)
    SET @mat_code = @@IDENTITY
END
GO


GO
CREATE PROCEDURE GetQualifStats
	@minQualif INT OUTPUT,
    @maxQualif INT OUTPUT
AS
SELECT @minQualif = MIN(worker_qualif),  @maxQualif = MAX(worker_qualif)
FROM ManufacturingCosts
GO
