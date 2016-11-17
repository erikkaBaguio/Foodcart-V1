create table Categories
(
	id           	SERIAL8 PRIMARY KEY,
	category_name	TEXT NOT NULL,
	is_active       BOOLEAN DEFAULT TRUE
);