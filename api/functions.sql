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