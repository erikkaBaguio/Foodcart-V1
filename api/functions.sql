--[GET] Retrieve specific restaurant
--select show_restaurant(1);
create or replace function show_restaurant(in par_restoID int, out bigint, out text, out text, out float, out float, out int, out boolean)
	returns setof record as
	$$
		select *
		from Restaurants
		where Restaurants.id = par_restoID;
	$$
	language 'sql';



create or replace function store_location(par_locname VARCHAR)
	returns TEXT as
	$$
		DECLARE
			loc_res TEXT;
		BEGIN
			if par_address = '' THEN
				loc_res = 'Error';
			ELSE
				INSERT INTO Location(location_name) VALUES (par_locname);

				loc_res = 'Location Added!'
			END IF;
			RETURN loc_res;
		END;
	$$
		language 'plpgsql';



create or replace function get_location(OUT INT, OUT VARCHAR)
	RETURNS SETOF RECORD as
	$$
		SELECT id, location_name FROM Location;
	$$
		language 'sql';



create or replace function show_location(IN par_id, OUT VARCHAR)
	RETURNS SETOF RECORD as
	$$
		SELECT location_name FROM Location WHERE id = par_id;
	$$
		language 'sql';



create or replace function store_role(par_rname VARCHAR)
	returns text as
	$$
		DECLARE
			loc_res TEXT;
		BEGIN
			if par_rname = '' THEN
				loc_res = 'Error';
			ELSE
				INSERT INTO	Roles(role_name) VALUES (par_rname);

				loc_res = 'Role Added!'
			END IF;
			RETURN loc_res;
		END;
	$$
		language 'plpgsql';



create or replace function store_user(par_fname VARCHAR, par_mname VARCHAR, par_lname VARCHAR, par_address VARCHAR, par_email VARCHAR,
									 par_mobileNum INT, par_password VARCHAR, par_roleID INT, par_points INT)
	returns text as
	$$
		DECLARE
			loc_res TEXT;
		BEGIN
			if par_fname = '' or par_mname = '' or par_lname = '' or par_address = '' or par_email = '' or par_mobileNum = '' or par_password = ''
							or par_roleID = '' or par_points = '' THEN
				loc_res = 'Error'
			ELSE
				INSERT INTO User(fname, mname, lname, address, email, mobile_number, password, role_id, earned_points) VALUES (par_fname, par_mname, 
								par_lname, par_address, par_email, par_mobileNum, par_password, par_roleID, par_points);

				loc_res = 'User Added!';
			END IF;
			RETURN loc_res;
		END;
	$$
		language 'plpgsql';



create or replace function get_user(OUT INT, OUT VARCHAR, OUT VARCHAR, OUT VARCHAR, OUT VARCHAR, OUT VARCHAR, OUT INT, OUT VARCHAR, OUT INT, OUT INT)
	RETURNS SETOF RECORD as
	$$
		SELECT id, fname, mname, lname, address, email, mobile_number, password, role_id, earned_points FROM Userinfo;
	$$
		language 'sql';



create or replace function show_user(in par_id INT, OUT VARCHAR, OUT VARCHAR, OUT VARCHAR, OUT VARCHAR, OUT INT, OUT VARCHAR, OUT INT, OUT INT)
	RETURNS SETOF RECORD as
	$$
		SELECT fname, mname, lname, address, email, mobile_number, password, role_id, earned_points FROM Userinfo WHERE id = par_id;
	$$
		language 'sql';



create or replace function update_user(in par_id INT, par_fname VARCHAR, par_mname VARCHAR, par_lname VARCHAR, par_address VARCHAR, 
										par_email VARCHAR, par_mobileNum INT, par_password VARCHAR, par_roleID INT, par_points INT)
	RETURNS VOID as
	$$
		UPDATE Userinfo
		SET
			fname = par_fname,
			mname = par_mname,
			lname = par_lname,
			address = par_address,
			email = par_email,
			mobile_number = par_mobileNum,
			password = par_password,
			role_id = par_roleID,
			earned_points = par_points
		WHERE id = par_id;
	$$
		language 'sql';