CREATE DATABASE store_management;


-----------------------------------------------------
CREATE TABLE products (
    `product_name` VARCHAR(255) PRIMARY KEY NOT NULL,
    `code` text NOT NULL , 
    `Price` integer(15) , 
    `Description` text ,
    `comes_from` VARCHAR(255),
    `found_in` VARCHAR(255)
);

ALTER TABLE products

ADD CONSTRAINT fk_comes_from FOREIGN KEY (comes_from)
REFERENCES suppliers(supplier_name)
on DELETE CASCADE on UPDATE CASCADE,

ADD CONSTRAINT fk_found_in FOREIGN KEY (found_in)
REFERENCES stores(store_name)
on DELETE CASCADE on UPDATE CASCADE;

-----------------------------------------------------
CREATE TABLE suppliers (
    `supplier_name` VARCHAR(255) PRIMARY KEY NOT NULL,
    `phone` text , 
    `email` VARCHAR(30) , 
    `BreifData` text ,
    `supplies` VARCHAR(255)
);

ALTER TABLE suppliers 

ADD CONSTRAINT fk_supplies FOREIGN KEY (supplies)
REFERENCES products(product_name)
on DELETE CASCADE on UPDATE CASCADE
;
-----------------------------------------------------
CREATE TABLE stores (
    `store_name` VARCHAR(255) PRIMARY KEY NOT NULL,
    `address` VARCHAR(30) ,
    `have_product` VARCHAR(255),
    `located_in` VARCHAR(50)
    );

ALTER TABLE stores 

ADD CONSTRAINT fk_have_product FOREIGN KEY (have_product)
REFERENCES products(product_name)
on DELETE CASCADE on UPDATE CASCADE,

ADD CONSTRAINT fk_located_in FOREIGN KEY (located_in)
REFERENCES governorate(governorate_name)
on DELETE CASCADE on UPDATE CASCADE
;

-----------------------------------------------------
CREATE TABLE governorate (
    `governorate_name` VARCHAR(50) PRIMARY KEY,
    `store_name` VARCHAR(255)
    );

ALTER TABLE governorate 

ADD CONSTRAINT fk_store_name FOREIGN KEY (store_name)
REFERENCES stores(store_name)
on DELETE CASCADE on UPDATE CASCADE
;

----------------------------------------------------
-- 1- from “orderdetails” table. 
-- Write a query to get all order numbers (without repetition) that contain any product starting with code S18 and price more than 100.
SELECT DISTINCT orderNumber from orderdetails WHERE productCode LIKE "S18%" AND priceEach > 100;  

-- 2- from “payments” table. 
-- Write a query to get all payments that were made on day 5 or 6 (whatever month or year).
SELECT paymentDate FROM payments WHERE DAY(paymentDate) IN ("05" , "06");

-- 3- from “customers” table.
-- Write a query to get the fifth-highest credit limit of the customers who (live in the USA and their phone number contains 5555).
SELECT DISTINCT creditLimit FROM customers WHERE country = "USA" AND phone LIKE "%5555%" ORDER BY creditLimit DESC LIMIT 1 OFFSET 4;