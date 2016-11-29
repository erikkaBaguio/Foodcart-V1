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


create table Location
(
	id						SERIAL8 UNIQUE NOT NULL PRIMARY KEY,
	location_name			TEXT NOT NULL
);

create table Roles
(
	id 				SERIAL8 PRIMARY KEY,
	role_name		TEXT NOT NULL
);

create table Userinfo
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

create table Orders
(
	id 					SERIAL8 PRIMARY KEY,
	role_id				INT REFERENCES Roles(id),
	payment_id			INT,
	transaction_date	DATE,
	time_stamp			TIMESTAMP,
	transaction_status	VARCHAR(50),
	total				FLOAT
);

create table Transaction
(
	id 					SERIAL8 PRIMARY KEY,
	transaction_number	VARCHAR(20),
	transaction_date	DATE,
	order 				INT REFERENCES Orders(id),
	is_active			BOOLEAN DEFAULT FALSE
);