CREATE DATABASE swiggy;
use swiggy;

-- order analysis
SELECT * FROM orders;

-- check null value 
SELECT order_id FROM orders 
WHERE order_total IS NULL OR restaurant_name IS NULL OR order_time IS NULL OR rain_mode IS NULL OR on_time IS NULL;
 -- no null value in the above query
 
 -- check how many distinct on time delivery (1 means delivery on time and 0 means delivery is not on time)
SELECT COUNT(DISTINCT order_id) as on_time_delivery FROM orders
WHERE on_time = 1;

 -- check how many distinct restaurant we have order from
 SELECT COUNT(DISTINCT restaurant_name) AS Total_retaurants FROM orders;
 
 -- check which is favourite restaurant
 SELECT restaurant_name, COUNT(restaurant_name) AS no_of_times FROM orders
 GROUP BY restaurant_name
 ORDER BY no_of_times DESC;
 
-- check latest order we made 
SELECT restaurant_name, order_id, order_time 
FROM orders
WHERE order_time = (SELECT MAX(order_time) FROM orders);

-- items analysis 
SELECT * FROM items;

-- check the no.of items
SELECT DISTINCT name FROM items;

-- check no of veg items 
SELECT COUNT(name) AS Total_veg from items
WHERE is_veg = 1;

-- check name of veg items 
SELECT name AS veg_item_names FROM items
WHERE is_veg =1;

-- check which items are other than veg or non veg
SELECT name FROM items
where is_veg != 1 AND is_veg != 0;

-- check items that are made of paneer
SELECT name FROM items 
WHERE name LIKE '%paneer%';

-- how many times each item is ordered
SELECT name, count(*) AS no_of_times FROM items
GROUP BY name
ORDER BY no_of_times DESC;