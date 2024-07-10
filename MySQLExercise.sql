-- Using the bestbuy database:
USE bestbuy;

-- 1 find all products
SELECT * FROM products;

-- 2 find all products that cost $1400
SELECT * FROM products WHERE price = 1400;

-- 3 find all products that cost $11.99 or $13.99
SELECT * FROM products WHERE price = 11.99 OR price = 13.99;

-- 4 find all products that do NOT cost 11.99 - using NOT
SELECT * FROM products WHERE NOT price = 11.99;

-- 5 find all products and sort them by price from greatest to least
SELECT * FROM products ORDER BY price DESC;

-- 6 find all employees who don't have a middle initial
SELECT * FROM employees WHERE middleinitial IS NULL;

-- 7 find distinct product prices
Select distinct price from products;

-- 8 find all employees whose first name starts with the letter ‘j’
Select * from employees where firstname like 'j%';

-- 9 find all Macbooks
select * from products where name = 'Macbook';

-- 10 find all products that are on sale
select * from products where OnSale = 1;

-- 11 find the average price of all products
select avg(price) from products;

-- 12 find all Geek Squad employees who don't have a middle initial
Select * from employees where title = "Geek Squad" and MiddleInitial is null;

-- 13 find all products from the products table whose stock level is in the range -- of 500 to 1200. Order by Price from least to greatest.
Select * from products where StockLevel between 500 and 1200 order by price asc;