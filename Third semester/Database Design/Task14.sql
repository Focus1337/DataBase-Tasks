CREATE DATABASE PublicCateringDb

use PublicCateringDb

CREATE TABLE Dishes
(
	id INT CONSTRAINT pk_dish PRIMARY KEY,
	title nvarchar,
	[type] nvarchar,
	outcome float,
	[image] nvarchar
)

CREATE TABLE Products
(
	id INT CONSTRAINT pk_product PRIMARY KEY,
	[name] nvarchar,
	calorie float,
	[weight] float,
	price float
)


CREATE TABLE DishProducts
(
	dish_id INT,
	product_id INT,

	-- блюдо может состоять из нескольких продуктов. Продукт может входить в состав нескольких блюд;
	--!! Поэтому ставлю первичный и внешний ключ на dish_id и product_id,
	--!!   которые указывают на id у Dishes и Products соотвественно (многие ко многим)
	
	CONSTRAINT pk_dp PRIMARY KEY(dish_id, product_id),

	CONSTRAINT fk_dp_dish FOREIGN KEY(dish_id)
			REFERENCES Dishes(id)
			on delete cascade on update cascade,

	CONSTRAINT fk_dp_product FOREIGN KEY(product_id)
			REFERENCES Products(id)
			on delete cascade on update cascade
)


CREATE TABLE Recipes
(
	dish_id INT,
	[time] int,
	technology nvarchar,

	-- блюдо имеет один рецепт. Рецепт соответствует одному блюду. 
	--!! Поэтому ставлю первичный и внешний ключ на dish_id, который указывает на id у Dishes (Связь один к одному)
	CONSTRAINT pk_recipe PRIMARY KEY(dish_id),
	CONSTRAINT fk_recipe_dish FOREIGN KEY(dish_id)
			REFERENCES Dishes(id)
			on delete cascade on update cascade,
)


CREATE TABLE Cooking
(
	cooking_id INT CONSTRAINT pk_cooking PRIMARY KEY,
	dish_id INT,
	portion_count int,
	[date] date,

	-- у блюда может быть несколько приготовлений (оно может приготавливаться в разные дни в некотором количестве порций). 
	-- Приготовление соотносится с одним блюдом; 
	--!! Поэтому ставлю внешний ключ на dish_id, который указывает на id у Dishes  (Связь один ко многим)
	CONSTRAINT fk_cooking_dish FOREIGN KEY(dish_id)
			REFERENCES Dishes(id)
			on delete cascade on update cascade
)