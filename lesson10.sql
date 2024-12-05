-- 1.The OrderItems table contains the individual items for each order. 
-- Write a SQL statement that returns the number of lines (as order_lines)
--  for each order number (order_num) and sort the results buy order_lines.
SELECT order_num, COUNT(*) as order_lines
FROM OrderItems
GROUP BY order_num
ORDER BY order_lines;

-- 2. Write a SQL statement that returns a field named cheapest_item 
-- which contains the lowest cost item for each vendor 
-- (using prod_price in the Products table), and sort the results from lowest to highest cost.
SELECT vend_id, MIN(prod_price) AS cheapest_item
FROM Products
GROUP BY vend_id
ORDER BY cheapest_item;

-- 3. It’s important to identify the best customers, 
-- so write a SQL statement to return the order number 
-- (order_num in OrderItems table) for all orders of at least 100 items.
SELECT order_num
FROM OrderItems
GROUP BY order_num
HAVING SUM(quantity) >= 100
ORDER BY order_num;

-- 4. Another way to determine the best customers is by how much 
-- they have spent. Write a SQL statement to return the order number 
-- (order_num in OrderItems table) for all orders with a total price 
-- of at least 1000. Hint, for this one you’ll need to calculate 
-- and sum the total (item_price multiplied by quantity). 
-- Sort the results by order number.
SELECT order_num, SUM(item_price*quantity) AS total_price
FROM OrderItems
GROUP BY order_num
HAVING SUM(item_price*quantity) >= 1000
ORDER BY order_num;

-- 5. What is wrong with the following SQL statement? (Try to figure it out without running it):
SELECT order_num, COUNT() AS items
FROM OrderItems
GROUP BY items
HAVING COUNT() >= 3
ORDER BY items, order_num;
-- GROUP BY items is incorrect. GROUP BY must be an actual column, 
-- not the one being used to perform the aggregate calculations. 
-- GROUP BY order_num would be allowed.
