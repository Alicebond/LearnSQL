-- 1. Write a SQL statement to return customer name (cust_name) from the 
-- Customers table and related order numbers (order_num) from the 
-- Orders table, sorting the result by customer name and then by order 
-- number. Actually, try this one twice, once using simple equijoin 
-- syntax and once using an INNER JOIN.
-- Equijoin syntax
SELECT cust_name, order_num 
FROM  Customers, Orders
WHERE Customers.cust_id = Orders.cust_id
ORDER BY cust_name, order_num;
-- ANSI INNER JOIN syntax
SELECT cust_name, order_num
From Customers
INNER JOIN Orders ON Customers.cust_id = Orders.cust_id
ORDER BY cust_name, order_num;

-- 2. Let’s make the previous challenge more useful. In addition to 
-- returning the customer name and order number, add a third column 
-- named OrderTotal containing the total price of each order. There 
-- are two ways to do this, you can create the OrderTotal column using 
-- a subquery on the OrderItems table, or you can join the OrderItems 
-- table to the existing tables and use an aggregate function. Here’s 
-- a hint, watch out for where you need to use fully qualified column 
-- names.
-- Solution using subqueries
SELECT cust_name, order_num, (SELECT SUM(quantity * item_price)
FROM OrderItems
WHERE Orders.order_num = OrderItems.order_num) AS OrderTotal 
FROM  Customers, Orders
WHERE Customers.cust_id = Orders.cust_id
ORDER BY cust_name, order_num;
-- Solution using joins
SELECT cust_name,
       Orders.order_num,
       Sum(item_price*quantity) AS OrderTotal
FROM Customers, Orders, OrderItems
WHERE Customers.cust_id = Orders.cust_id
 AND Orders.order_num = OrderItems.order_num
GROUP BY cust_name, Orders.order_num
ORDER BY cust_name, order_num;

-- 3. Let’s revisit Challenge 1 from Lesson 11. Write a SQL statement 
-- that retrieves the dates when product BR01 was ordered, but this 
-- time use a join and simple equijoin syntax. The output should be 
-- identical to the one from Lesson 12.
SELECT cust_id, order_date
FROM Orders, OrderItems
WHERE Orders.order_num = OrderItems.order_num
  AND prod_id = 'BR01'
ORDER BY order_date;

SELECT cust_id, order_date
FROM Orders
INNER JOIN OrderItems ON Orders.order_num = OrderItems.order_num
  AND prod_id = 'BR01'
ORDER BY order_date;

-- 4. That was fun, let’s try it again. Recreate the SQL you wrote for 
-- Lesson 11 Challenge 3, this time using ANSI INNER JOIN syntax. The 
-- code you wrote there employed two nested subqueries, and to 
-- recreate it you’ll need two INNER JOIN statements, each formatted 
-- like the INNER JOIN example earlier in this lesson. And don’t 
-- forget the WHERE clause to filter by prod_id.
SELECT cust_email 
FROM Customers, Orders, OrderItems
WHERE Customers.cust_id = Orders.cust_id
  AND Orders.order_num = OrderItems.order_num
  AND prod_id = 'BR01';

SELECT cust_email 
FROM Customers
  INNER JOIN Orders ON Customers.cust_id = Orders.cust_id
  INNER JOIN OrderItems ON Orders.order_num = OrderItems.order_num
  AND prod_id = 'BR01';

-- 5. One more, and to make things more fun we’ll mix joins, 
-- aggregates functions, and grouping, too. Ready? Back in Lesson 10 I 
-- issued you a Challenge to find all order numbers with a value of 
-- 1000 or more. Those results are useful, but what would be even more 
-- useful is the name of the customers who placed orders of at least 
-- that amount. So, write a SQL statement that uses joins to return 
-- customer name (cust_name) from the Customers table, and the total 
-- price of all orders from the OrderItems table. Here’s a hint, to 
-- join those tables you’ll also need to include the Orders table (as 
-- Customers is not related directly to OrderItems, Customers is 
-- related to Orders and Orders is related to OrderItems). Don’t 
-- forget the GROUP BY and HAVING, and sort the results by customer 
-- name. You can use simple equijoin or ANSI INNER JOIN syntax for 
-- this one. Or, if you are feeling brave, try writing it both ways.
SELECT cust_name, SUM(quantity * item_price) AS total_price
FROM Customers, Orders, OrderItems
WHERE Customers.cust_id = Orders.cust_id
  AND Orders.order_num = OrderItems.order_num
GROUP BY cust_name
HAVING SUM(quantity * item_price) >= 1000
ORDER BY cust_name;

SELECT cust_name, SUM(quantity * item_price) AS total_price
FROM Customers
  INNER JOIN Orders ON Customers.cust_id = Orders.cust_id
  INNER JOIN OrderItems ON Orders.order_num = OrderItems.order_num
GROUP BY cust_name
HAVING SUM(quantity * item_price) >= 1000
ORDER BY cust_name; 
