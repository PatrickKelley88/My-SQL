/* joins: select all the computers from the products table:

using the products table and the categories table, return the product name and the category name */
SELECT categories.Name AS 'Category Name', products.Name AS 'Product Name'
From products 
INNER JOIN categories ON products.CategoryID = categories.CategoryID
WHERE categories.Name = 'Computers';

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT Name, Price, Rating
FROM Products
INNER JOIN reviews ON products.ProductID = reviews.ProductID
WHERE Rating = 5;

/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT employees.EmployeeID, FirstName, LastName, SUM(Quantity)
FROM employees
INNER JOIN sales ON employees.EmployeeID = sales.EmployeeID
GROUP BY employees.EmployeeID
HAVING SUM(Quantity) = (
	SELECT SUM(Quantity)
    FROM employees
    INNER JOIN sales ON employees.EmployeeID = sales.EmployeeID
    GROUP BY employees.EmployeeID
    ORDER BY SUM(Quantity) DESC
    LIMIT 1
    );

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT departments.Name AS 'Dept', categories.Name AS 'Category'
FROM departments
INNER JOIN categories ON departments.DepartmentID = categories.DepartmentID
WHERE categories.Name = 'Appliances' OR categories.Name = 'Games';

/* joins: find the product name, total # sold, and total price sold, for Eagles: Hotel California --You may need to use SUM() */
SELECT Name, SUM(Quantity), SUM(Price)
FROM products
INNER JOIN sales on products.ProductID = sales.ProductID
WHERE Name LIKE '%Hotel%California'
GROUP BY products.ProductID;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT Name, Reviewer, Rating, Comment
From products
INNER JOIN reviews ON products.ProductID = reviews.ProductID
Where Rating = 1 AND name like '%Visio%';


-- ------------------------------------------ Extra - May be difficult

/* Your goal is to write a query that serves as an employee sales report.

This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */

SELECT employees.EmployeeID, FirstName, LastName, Name,Date, SUM(Quantity)
FROM employees
INNER JOIN sales ON employees.EmployeeID = sales.EmployeeID
INNER JOIN products ON products.ProductID = sales.ProductID
GROUP BY employees.EmployeeID, products.ProductID
ORDER BY employees.EmployeeID, products.ProductID;

SELECT employees.EmployeeID, FirstName, LastName, Name, Date, Quantity
FROM employees
INNER JOIN sales ON employees.EmployeeID = sales.EmployeeID
INNER JOIN products ON products.ProductID = sales.ProductID
ORDER BY employees.EmployeeID DESC, products.ProductID, Date;

