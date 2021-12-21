use ControlWork

--Файл16а. Склады
-- номер склада; PK
-- фамилия материально ответственного лица.

CREATE TABLE Storages
(
	storage_id INT NOT NULL IDENTITY, -- PK
	family NVARCHAR(20) NOT NULL,
	CONSTRAINT pk_storage PRIMARY KEY(storage_id)
)

--Файл16в. Наличие изделий (деталей) на складах

-- номер склада; PK
-- код изделия (детали); PK
-- единица измерения;
-- количество, имеющееся на складе;
-- дата последней операции.

CREATE TABLE DetailsAviability
(
	storage_id INT NOT NULL, -- PK
	detail_id INT NOT NULL, -- PK
	unit NVARCHAR(20) NOT NULL default('шт'),
	[count] INT NOT NULL check([count] >= 0),
	last_oper_date DATE NOT NULL,
	CONSTRAINT pk_detailAviability PRIMARY KEY(storage_id, detail_id),

	CONSTRAINT fk_detailAviability_storage FOREIGN KEY(storage_id)
		REFERENCES Storages(storage_id)
		on delete cascade on update cascade,
)

--Файл14. Учет отгрузки готовой продукции
-- номер склада; PK
-- номер документа об отгрузке; PK
-- код покупателя;
-- код готового изделия;
-- единица измерения;
-- количество;
-- дата отгрузки;

CREATE TABLE ShipmentAccountings
(
	storage_id INT NOT NULL, -- PK
	document_id INT NOT NULL, -- PK
	customer_id INT NOT NULL,
	detail_id INT NOT NULL,
	unit NVARCHAR(20) NOT NULL default('шт'),
	[count] INT NOT NULL check([count] >= 0),
	shipment_date DATE NOT NULL,
	CONSTRAINT pk_shipmentAccounting PRIMARY KEY(storage_id, document_id),

	

	CONSTRAINT fk_shipmentAccounting_detailAviability FOREIGN KEY(storage_id, detail_id)
		REFERENCES DetailsAviability(storage_id, detail_id)
		on delete cascade on update cascade
)











--CONSTRAINT fk_shipmentAccounting_storage FOREIGN KEY(storage_id)
--		REFERENCES Storages(storage_id)
--		on delete cascade on update cascade,