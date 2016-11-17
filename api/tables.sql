create table Categories
(
	id           	SERIAL8 PRIMARY KEY,
	category_name	TEXT NOT NULL,
	is_active       BOOLEAN DEFAULT TRUE
);


create table Restaurants 
(
	id           	SERIAL8 PRIMARY KEY,
	resto_name 		TEXT NOT NULL,
	location		TEXT,
	min_order		FLOAT,
	del_fee			FLOAT,
 	resto_categories INT REFERENCES Categories (id),
  	is_active       BOOLEAN DEFAULT TRUE
);