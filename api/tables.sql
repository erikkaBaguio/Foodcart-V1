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
	id				SERIAL8 PRIMARY KEY,
	address			VARCHAR(50), NOT NULL
);

create table Roles
(
	id 				SERIAL8 PRIMARY KEY,
	role_name		VARCHAR(25),
);

create table User
(
	id				SERIAL8 PRIMARY KEY,
	fname			TEXT,
	mname			TEXT,
	lname			TEXT,
	address			VARCHAR(100) NOT NULL,
	email			VARCHAR(50),
	mobile_number	INT,
	password		VARCHAR(50),
	role_id			INT REFERENCES Roles(id),
	earned_points	INT
);

create table Order
(
	id 					SERIAL8 PRIMARY KEY,
	role_id				INT REFERENCES Roles(id),
	payment_id			INT,
	transaction_date	DATE,
	time_stamp			TIMESTAMP,
	transaction_status	VARCHAR(50),
	total				VARCHAR(50)
);

create table Transaction
(
	id 					SERIAL8 PRIMARY KEY,
	transaction_number	VARCHAR(20),
	transaction_date	DATE,
	order 				INT REFERENCES Order(id),
	is_active			BOOLEAN DEFAULT FALSE
);