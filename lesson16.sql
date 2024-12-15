-- 1. USA State abbreviations should always be in upper case. Write a SQL 
-- statement to update all USA addresses, both vendor states 
-- (vend_state in Vendors) and customer states (cust_state in 
-- Customers) so that they are upper case.
UPDATE Vendors
SET vend_state = UPPER(vend_state)
WHERE vend_country = 'USA';
-- SELECT vend_id FROM Vendors;
UPDATE Customers
SET cust_state = UPPER(cust_state)
WHERE cust_country = 'USA';

-- 2. In Lesson 15 Challenge 1 I asked you to add yourself to the 
-- Customers table. Now delete yourself. Make sure to use a WHERE 
-- clause (and test it with a SELECT before using it in DELETE) or 
-- you’ll delete all customers!
-- First test the WHERE to make sure it selects only what you want to delete
SELECT * FROM Customers
WHERE cust_id = 100000007;
-- Then do it!
DELETE FROM Customers
WHERE cust_id = 100000007;
