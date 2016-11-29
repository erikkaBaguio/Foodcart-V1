--------------------------------
--FEATURE: Explore and Discover
--------------------------------

--[GET] Retrieve a specific restaurant
--select show_restaurant(1);
create or replace function show_restaurant(in par_restoID int, out bigint, out text, out float, out float, out text, out boolean)
	returns setof record as
	$$
		select 	Restaurant.*
		from Restaurant
		WHERE Restaurant.id = par_restoID;
	$$
	language 'sql';


--[GET] Retrieve all restaurants
--select show_allrestaurants();
create or replace function show_allrestaurants(out bigint, out text, out float, out float, out text, out boolean)
	returns setof record as
	$$
		select 	Restaurant.*
		from Restaurant
	$$
	language 'sql';


--[POST] Insert Restaurant info
--select store_restaurant('Frappella' ,50,0, 'San Miguel, Iligan City');
create or replace function store_restaurant(in par_restoName text, in par_minOrder float, in par_deliveryFee float, in par_location text)
	returns text as 
	$$
		declare
			local_response text;
		begin

			insert into Restaurant(resto_name, min_order, delivery_fee, location)
				values (par_restoName, par_minOrder, par_deliveryFee, par_location);
			
			local_response = 'OK';
			return local_response;

		end
	$$
	language 'plpgsql';


