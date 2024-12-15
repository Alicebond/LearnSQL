-- 1. Create a view called CustomersWithOrders that contains all of 
-- the columns in Customers, but only includes those who have placed 
-- orders. Hint, you can JOIN the Orders table to filter just the 
-- customers you want. Then use a SELECT to make sure you have the 
-- right data.
CREATE VIEW CustomersWithOrders AS
SELECT Customers.cust_address, 
  Customers.cust_city, 
  Customers.cust_contact,
  Customers.cust_country,
  Customers.cust_email,
  Customers.cust_id,
  Customers.cust_name,
  Customers.cust_state,
  Customers.cust_zip
FROM Customers 
INNER JOIN Orders ON Customers.cust_id = Orders.cust_id;

SELECT * FROM CustomersWithOrders;
