use materialsdb


DECLARE @mat_code INT
EXEC CreateMaterial @mat_code OUTPUT, 'Кирпич', 'шт', 500
select 'ID нового созданного материала ' + CONVERT(NVARCHAR, @mat_code)



go
DECLARE @minQualif INT, @maxQualif INT
EXEC GetQualifStats @minQualif OUTPUT, @maxQualif OUTPUT
PRINT 'Минимальная квалификация: ' + CONVERT(VARCHAR, @minQualif)
PRINT 'Максимальная квалификация: ' + CONVERT(VARCHAR, @maxQualif)
go

go
SELECT * FROM Materials
go
