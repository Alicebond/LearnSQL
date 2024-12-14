-- 1. Write a SQL statement using an INNER JOIN to retrieve customer 
-- name (cust_name in Customers) and all order numbers (order_num in 
-- Orders) for each.
SELECT Customers.cust_name, Orders.order_num
FROM Customers
  INNER JOIN Orders ON Customers.cust_id = Orders.cust_id

-- 2. Modify the SQL statement you just created to list all customers, 
-- even those with no orders.
SELECT Customers.cust_name, Orders.order_num
FROM Customers
  LEFT OUTER JOIN Orders ON Customers.cust_id = Orders.cust_id

-- 3. Use an OUTER JOIN to join the Products and OrderItems tables, 
-- returning a sorted list of product names (prod_name) and the order 
-- numbers (order_num) associated with each.
SELECT prod_name, order_num
FROM Products
  LEFT OUTER JOIN OrderItems ON Products.prod_id = OrderItems.prod_id
ORDER BY prod_name;

-- 4. Modify the SQL statement created in the previous challenge so 
-- that it returns a total of number of orders for each item (as 
-- opposed to the order numbers).
SELECT prod_name, COUNT(order_num) AS num_ord
FROM Products
  LEFT OUTER JOIN OrderItems ON Products.prod_id = OrderItems.prod_id
GROUP BY prod_name
ORDER BY prod_name;

-- 5. Write a SQL statement to list vendors (vend_id in Vendors) and 
-- the number of products they have available, including vendors with 
-- no products. You’ll want to use an OUTER JOIN and the COUNT() 
-- aggregate function to count the number of products for each in the 
-- Products table. Pay attention, the vend_id column appears in 
-- multiple tables so any time you refer to it you’ll need to fully 
-- qualify it.
SELECT Vendors.vend_id, COUNT(prod_id) AS num_prod
FROM Vendors
  LEFT OUTER JOIN Products ON Vendors.vend_id = Products.vend_id
GROUP BY Vendors.vend_id
ORDER BY Vendors.vend_id;
