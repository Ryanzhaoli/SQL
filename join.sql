use bestbuy;
-- joins: select all the computers from the products table:
-- using the products table and the categories table, return the product name and the category name 
SELECT p.Name, c.Name from products as p JOIN categories as c ON p.CategoryID = c.CategoryID WHERE c.Name = 'Computers';

-- joins: find all product names, product prices, and products ratings that have a rating of 5
SELECT p.Name, p.Price, r.Rating FROM products as p JOIN reviews as r on p.ProductID = r.ProductID WHERE r.rating = 5;

-- joins: find the employee with the most total quantity sold.  use the sum() function and group by
SELECT e.EmployeeID, e.FirstName, e.LastName,Sum(Quantity) as Quantity 
	FROM employees as e 
    JOIN sales as s on e.EmployeeID = s.EmployeeID 
GROUP BY e.EmployeeID 
ORDER BY Quantity DESC;

-- joins: find the name of the department, and the name of the category for Appliances and Games
SELECT d.Name, c.Name 
	FROM departments as d 
    JOIN categories as c on d.DEpartmentId = c.DepartmentID 
WHERE c.Name = 'Appliances' OR c.Name = 'Games';

-- joins: find the product name, total # sold, and total price sold,
 -- for Eagles: Hotel California --You may need to use SUM()
 SELECT p.Name, SUM(s.Quantity) as `No. Sold`, sum(s.quantity*s.priceperunit) as `Total Price Sold` 
	FROM products as p 
    JOIN sales as s ON p.ProductID = s.ProductID 
WHERE p.Name = 'Eagles: Hotel California'
GROUP BY p.Name ORDER BY `Total Price Sold` DESC;

-- joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!)
SELECT p.Name, r.reviewer, r.rating, r.comment 
FROM products as p 
JOIN reviews as r 
ON p.ProductID = r.ProductID
WHERE r.rating = 1 and p.name LIKE 'Visio%'; 

-- ------------------------------------------ Extra - May be difficult
-- Your goal is to write a query that serves as an employee sales report.
-- This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
SELECT e.EmployeeID, e.FirstName, e.LastName, p.Name as Product, sum(s.quantity) as `NO. Sold`, SUM(Quantity*priceperunit) as `Total Sales`
	FROM employees as e 
    INNER JOIN sales as s on e.EmployeeID = s.EmployeeID
    INNER JOIN products as p on s.ProductID = p.ProductID
GROUP BY s.EmployeeID, s.ProductID ORDER BY s.EmployeeID, `Total Sales` DESC;