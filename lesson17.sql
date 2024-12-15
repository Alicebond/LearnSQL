-- 1. Add a web site column (vend_web) to the Vendors table. You’ll 
-- want a text field big enough to accommodate a URL.
ALTER TABLE Vendors
ADD vend_web CHAR(256);

-- 2. Use UPDATE statements to update Vendors records to include a 
-- website (you can make up any address). 
UPDATE Vendors
SET vend_web = 'www.wwwwwxxxxx.com'
WHERE vend_id = 'BRS01';
