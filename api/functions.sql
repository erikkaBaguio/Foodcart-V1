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

