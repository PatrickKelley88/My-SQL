-- 1 joins: select all the computers from the products table:
Select * from products where categoryid = 1;
-- using the products table and the categories table, return the product name and the category name */
Select products.name, categories.name
from products
inner join categories on product.CategoriesID = categories.CategoryID
where categories.name = 'Computers';
-- 2 joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT  product.name, products.price, reviews.rating
From products 
inner join reviews on products.ProductID = reviews.ProductID
where reviews.rating = 5;

-- 3 joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT employees.EmployeeID, FirstName, LastName, SUM(Quantity)
FROM employees
INNER JOIN sales ON employees.EmployeeID = sales.EmployeeID
GROUP BY employees.EmployeeID
Having sum(quanity) = (
-- sub query to get the "37" or w/e value
	SELECT SUM(Quantity)
    From employees
    INNER JOIN sales ON employees.EmployeeID = sales.EmployeeID
    GROUP BY employees.EmployeeID
    ORDER BY SUM(Quantity) DESC
    LIMIT 1
);

-- 4 joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT departments.Name AS 'dept', categories.Name AS 'Category'
FROM departments 
INNER JOIN categories ON departments.DepartmentID = categories.DepartmentID
WHERE categories.Name IN ('Appliances','Games');

-- 5 joins: find the product name, total # sold, and total price sold,for Eagles: Hotel California --You may need to use SUM() 

SELECT products.Name, Sum(sales.Quantity), Sum(sales.Quantity * products.Price)
FROM products 
INNER JOIN sales ON products.ProductID = sales.ProductID 
WHERE products.Name LIKE'%Hotel California'
GROUP BY products.ProductID;

-- 6 joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */

Select products.name, reviews.Reviewer, reviews.rating, reviews.Comment
From Products
INNER JOIN reviews ON products.ProductID = reviews.ProductID
Where products.name = 'Visio TV'


-- ------------------------------------------ Extra - May be difficult

-- Your goal is to write a query that serves as an employee sales report. This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
SELECT employees.EmployeeID, employees.FirstName, employees.LastName, product.Name, sales.Quantity
From employees
INNER JOIN sales ON employees.EmployeeID = sales.EmployeeID
INNER JOIN products ON sales.ProductOD = products.ProductID
Group BY employees.EmployeeID, employees.FirstName, employees.LastName products.Name
Order BY employees.EmployeeID, products.NAME;

