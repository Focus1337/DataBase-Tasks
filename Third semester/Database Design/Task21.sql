CREATE DATABASE CurrencyExchangeDb

use CurrencyExchangeDb

CREATE TABLE Customers
(
	id INT CONSTRAINT pk_dish PRIMARY KEY,
	full_name NVARCHAR,
	passport_id INT
)

CREATE TABLE Currencies
(
	sold_cur_id INT,
	bought_cur_id INT,
	[name] NVARCHAR,
	selling_rate FLOAT,
	purchase_rate FLOAT,

	CONSTRAINT pk_currency PRIMARY KEY(sold_cur_id, bought_cur_id)
)

CREATE TABLE Cashiers
(
	id INT CONSTRAINT pk_cashier PRIMARY KEY,
	full_name NVARCHAR
)

CREATE TABLE Deals
(
	sold_cur_id INT,
	bought_cur_id INT,
	cashier_id INT,
	customer_id INT,
	deal_date DATE,
	deal_time TIME,
	sold_amount FLOAT,
	bought_amount FLOAT,
	
	-- один к одному
	CONSTRAINT pk_deal PRIMARY KEY(cashier_id),
	CONSTRAINT fk_deal_cashier FOREIGN KEY(cashier_id)
			REFERENCES Cashiers(id)
			on delete cascade on update cascade,
	-- один ко многим
	CONSTRAINT fk_deal_customer FOREIGN KEY(customer_id)
			REFERENCES Customers(id)
			on delete cascade on update cascade,
	-- один ко многим
	CONSTRAINT fk_deal_currency FOREIGN KEY(sold_cur_id, bought_cur_id)
			REFERENCES Currencies(sold_cur_id, bought_cur_id)
			on delete cascade on update cascade
)