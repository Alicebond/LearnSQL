-- 1. Using a subquery, return a list of customers who bought items
--  priced 10 or more. You’ll want to use the OrderItems table to find
--  the matching order numbers (order_num), and then the Orders table
--  to retrieve the customer id (cust_id) for those matched orders.
SELECT cust_id 
FROM Orders
WHERE order_num IN ( SELECT order_num
                      FROM OrderItems
                      WHERE item_price >= 10);

-- 2. You need to know the dates when product BR01 was ordered. 
-- Write a SQL statement that uses a subquery to determine which 
-- orders (in OrderItems) purchased prod_id BR01, and then returns 
-- customer id (cust_id) and order date (order_date) for each from 
-- the Orders table. Sort the results by order date.
SELECT cust_id, order_date
FROM Orders
WHERE order_num IN ( SELECT order_num 
                      FROM OrderItems
                      WHERE prod_id = 'BR01')
ORDER BY order_date;

-- 3.Now let’s make it a bit more challenging. Update the previous 
-- challenge to return the customer email (cust_email in the Customers 
-- table) for any customers who purchased item with a prod_id of BR01. 
-- Hint, this involves the SELECT statement, the innermost one 
-- returning order_num from OrderItems, and the middle one returning 
-- cust_id from Orders.
SELECT cust_email FROM Customers
WHERE cust_id IN ( SELECT cust_id 
                    FROM Orders
                    WHERE order_num IN ( SELECT order_num 
                                          FROM OrderItems
                                          WHERE prod_id = 'BR01'));

-- 4. We need a list of customer ids with the total amount they have 
-- ordered. Write a SQL statement to return customer id (cust_id in 
-- Orders table) and total_ordered using a subquery to return the 
-- total of orders for each customer. Sort the results by amount spent 
-- from greatest to the least. Hint, you’ve used the SUM() to 
-- calculate order totals previously.
SELECT cust_id,
(SELECT SUM(quantity * item_price)
  FROM OrderItems 
  WHERE order_num in
    (SELECT order_num FROM Orders
    WHERE Customers.cust_id = Orders.cust_id)) AS total_ordered
FROM Customers
ORDER BY total_ordered DESC;
-- 5. One more. Write a SQL statement that retrieves all product names 
-- (prod_name) from the Products table, along with a calculated named 
-- quant_sold containing the total number of this item sold (retrieved 
-- using a subquery and a SUM(quantity) on the OrderItems table).
SELECT prod_name, 
  (SELECT SUM(quantity) FROM OrderItems 
  WHERE Products.prod_id = OrderItems.prod_id ) AS total_sold
FROM Products;
