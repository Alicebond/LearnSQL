-- 1. Write a SQL statement that combines two SELECT statements that 
-- retrieve product id (prod_id) and quantity from the OrderItems 
-- table, one filtering for rows with a quantity of exactly 100, and 
-- the other filtering for products with an ID that begins with BNBG. 
-- Sort the results by product id.
SELECT prod_id, quantity
FROM OrderItems
WHERE quantity = 100
UNION
SELECT prod_id, quantity
FROM OrderItems
WHERE prod_id  LIKE 'BNBG%'
ORDER BY prod_id;

-- 2. Rewrite the SQL statement you just created to use a single 
-- SELECT statement.
SELECT prod_id, quantity
FROM OrderItems
WHERE quantity = 100
  OR prod_id LIKE 'BNBG%' 
ORDER BY prod_id;

-- 3. This one is a little nonsensical, I know, but it does reinforce 
-- a note earlier in this lesson. Write a SQL statement which returns 
-- and combines product name (prod_name) from Products and customer 
-- name (cust_name) from Customers, and sort the result by product 
-- name.
SELECT prod_name AS name FROM Products
UNION
SELECT cust_name FROM Customers
ORDER BY prod_name;
