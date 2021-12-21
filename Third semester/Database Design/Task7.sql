CREATE DATABASE Trade

use Trade

CREATE TABLE Departaments
(
	id INT CONSTRAINT pk_departament PRIMARY KEY,
	[name] NVARCHAR,
	phone_number NVARCHAR,
	sales_volume float
)


CREATE TABLE Products
(
	id INT CONSTRAINT pk_product PRIMARY KEY,
	title NVARCHAR,
	unit NVARCHAR,
	price float
)

CREATE TABLE Sales
(
	id INT CONSTRAINT pk_sale PRIMARY KEY,
	departament_id INT,
	product_id INT,
	sale_date DATE,
	[count] INT,

	CONSTRAINT fk_sale_departament FOREIGN KEY(departament_id)
			REFERENCES Departaments(id)
			on delete cascade on update cascade,

	CONSTRAINT fk_sale_product FOREIGN KEY(product_id)
			REFERENCES Products(id)
			on delete cascade on update cascade
)