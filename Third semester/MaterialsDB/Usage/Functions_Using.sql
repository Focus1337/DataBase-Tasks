use materialsdb

SELECT *
FROM Materials m-- join MaterialsConsumption c on m.mat_code = c.mat_code
WHERE m.price > dbo.GetMaterialsSumFunc('Лесоматериалы круглые') -- as 'price with consumption sum'

--SELECT 'Материал "' + name + '" используется ' + CONVERT(nvarchar, consumption) + unit + ' в день. Цена расхода в день: ' + CONVERT(nvarchar, price) as 'stat'
SELECT *
FROM dbo.GetMaterialStatsTableFunc('Лесоматериалы круглые')

SELECT * from Materials
SELECT * from MaterialsConsumption