USE materialsdb
DELETE FROM MaterialsConsumption
DELETE FROM ManufacturingCosts
DELETE FROM Materials

GO
SET IDENTITY_INSERT Materials on
INSERT INTO Materials (mat_code, name, unit, price)
	VALUES
		 (2, 'Крепежная деталь из стали', default, 8),
		 (4, 'Заклепка', default, 7),
		 (1, 'Брусок 50x50', default, 40),
		 (12, 'Канат двойной свивки ТК', 'м', 50),
		 (7, 'Лесоматериалы круглые', 'м3', 300),
		 (3, 'Швеллеры', 'т', 4920)
SET IDENTITY_INSERT Materials off
GO

GO
	INSERT INTO ManufacturingCosts (det_code, oper_num, worker_code, worker_qualif, tariff_code, pf_time, piece_time)
	  VALUES
			(33, 1, 10001, 1, 8, 10, 30),
			(44, 2, 10002, 2, 8, 10, 35),
			(12, 3, 10010, 2, 8, 12, 30),
			(5, 4, 10012, 3, 7, 12, 25),
			(8, 5, 10008, 4, 7, 16, 20),
			(3, 6, 10022, 1, 6, 15, 40)
GO

GO
  INSERT INTO MaterialsConsumption (det_code, mat_code, oper_num, unit, consumption)
	VALUES
		  (33, 12, 1, 'шт', 122),
		  (33, 1, 1, 'шт', 200),
		  (5, 4, 4, 'м', 12),
		  (8, 7, 5, 'м3', 1),
		  (3, 7, 6, 'кг', 2),
		  (12, 2, 3, 'т', 0.53)
GO

SELECT * FROM Materials;
SELECT * FROM ManufacturingCosts;
SELECT * FROM MaterialsConsumption;