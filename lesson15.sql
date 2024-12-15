-- 1. Using INSERT and columns specified, add yourself to the 
-- Customers table.
INSERT INTO Customers(cust_id,
  cust_name,
  cust_address,
  cust_city,
  cust_zip)
VALUES(1000000007,
  'VII',
  'Moon',
  'P',
  886);

-- 2. Make a backup copy of your Orders and OrderItems tables.
CREATE TABLE OrderCopy AS SELECT *
FROM Orders;

CREATE TABLE OrderItemsCopy AS
SELECT * FROM OrderItems;
