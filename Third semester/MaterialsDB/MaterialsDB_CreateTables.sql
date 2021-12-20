use materialsdb

CREATE TABLE Materials
(
	mat_code INT NOT NULL IDENTITY,
	name NVARCHAR(30) NOT NULL,
	unit NVARCHAR(5) DEFAULT('רע'),
	price DECIMAL(19,4) NOT NULL CHECK (price > 0)
	CONSTRAINT pk_mat PRIMARY KEY(mat_code)
)


CREATE TABLE ManufacturingCosts
(
	det_code INT NOT NULL,
	oper_num INT NOT NULL,
	worker_code INT NOT NULL CHECK(worker_code > 10000),
	worker_qualif INT NOT NULL CHECK(worker_qualif > 0),
	tariff_code INT NOT NULL,
	pf_time INT NOT NULL default(10) CHECK(pf_time > 0),
	piece_time INT NOT NULL CHECK(piece_time > 0),
	CONSTRAINT pk_manufact PRIMARY KEY(det_code, oper_num)
)


CREATE TABLE MaterialsConsumption
(
	det_code INT NOT NULL,
	mat_code INT NOT NULL,
	oper_num INT NOT NULL,
	unit nvarchar(5) default('רע'),
	consumption decimal(19,4) NOT NULL CHECK (consumption > 0),
	CONSTRAINT pk_consump PRIMARY KEY(det_code, mat_code, oper_num),
	
	CONSTRAINT fk_consump_manufact FOREIGN KEY(det_code, oper_num)
		REFERENCES ManufacturingCosts(det_code, oper_num)
		on delete cascade on update cascade,

	CONSTRAINT fk_consump_mat FOREIGN KEY(mat_code)
		REFERENCES Materials(mat_code)
)