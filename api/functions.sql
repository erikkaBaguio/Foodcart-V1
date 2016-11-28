--[GET] Retrieve a specific restaurant
--select show_restaurant(1);
create or replace function show_restaurant(in par_restoID int, out bigint, out text, out float, out float, out boolean, out text)
	returns setof record as
	$$
		select 	Restaurant.*,
				Location.location_name
		from Restaurant_location
		INNER JOIN Restaurant ON (
			Restaurant_location.restaurant_id = Restaurant.id
		)
		INNER JOIN Location ON (
			Restaurant_location.location_id = Location.id
		)
		WHERE Restaurant_location.id = par_restoID;
	$$
	language 'sql';