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

create or replace function new_location(par_address VARCHAR)
	returns TEXT as
	$$
		DECLARE
			loc_res TEXT;
		BEGIN
			if par_address = '' THEN
				loc_res = 'Error';
			ELSE
				INSERT INTO Location(address) VALUES (par_address);

				loc_res = 'Location Added!'
			END IF;
			RETURN loc_res;
		END;
	$$
		language 'plpgsql';