CREATE TABLE Category
(
	id           	SERIAL8 PRIMARY KEY,
	category_name	TEXT NOT NULL,
	is_active       BOOLEAN DEFAULT TRUE
);

CREATE TABLE Restaurant
(
	id           	SERIAL8 PRIMARY KEY,
	resto_name 		TEXT NOT NULL,
	min_order		FLOAT,
	delivery_fee	FLOAT,
  	is_active       BOOLEAN DEFAULT TRUE
);

CREATE TABLE Food
(	id				SERIAL8 PRIMARY KEY,
	food_name		TEXT NOT NULL,
	description		TEXT NOT NULL,
	unit_cost		FLOAT,
	is_active		BOOLEAN DEFAULT TRUE
);

CREATE TABLE Location
(
	id				SERIAL8 UNIQUE NOT NULL PRIMARY KEY,
	location_name	TEXT NOT NULL
);

CREATE TABLE Roles
(
	id 				SERIAL8 PRIMARY KEY,
	role_name		TEXT NOT NULL
);

CREATE TABLE Userinfo
(
	id				SERIAL8 PRIMARY KEY,
	fname			TEXT,
	mname			TEXT,
	lname			TEXT,
	address			TEXT NOT NULL,
	email			TEXT,
	mobile_number	INT,
	password		VARCHAR(50),
	role_id			INT REFERENCES Roles(id),
	earned_points	INT
);

CREATE TABLE Orders
(
	id 					SERIAL8 PRIMARY KEY,
	role_id				INT REFERENCES Roles(id),
	payment_id			INT,
	transaction_date	DATE,
	time_stamp			TIMESTAMP,
	transaction_status	VARCHAR(50),
	total				FLOAT
);

CREATE TABLE Transaction
(
	id 					SERIAL8 PRIMARY KEY,
	transaction_number	VARCHAR(20),
	transaction_date	DATE,
	order_id 			INT REFERENCES Orders(id),
	is_active			BOOLEAN DEFAULT FALSE
);

CREATE TABLE Food_category
(
	id           	SERIAL8 PRIMARY KEY,
	food_id			INT REFERENCES Food(id),
	category_id		INT REFERENCES Category(id)
);

CREATE TABLE Restaurant_location
(
	id				SERIAL8 PRIMARY KEY,
	restaurant_id	INT REFERENCES Restaurant(id),
	location_id 	INT REFERENCES Location(id)
);

CREATE TABLE Order_foods
(
	id 				SERIAL8 PRIMARY KEY,
	order_id		INT REFERENCES Orders(id),
	food_id			INT REFERENCES Food(id),
	quantity		INT,
	total_cost		FLOAT
);