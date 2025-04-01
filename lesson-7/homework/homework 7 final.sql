-- Q 2. Write a query to find the maximum (MAX) Salary from the Employees table.

Select MAX (Salary) from Employees

-- Q  3. Write a query to count the number of rows in the Customers table using COUNT(*).

select Count (*) from Customers

-- Q  4. Write a query to count the number of unique product categories (COUNT(DISTINCT Category)) from the Products table.

select count (distinct Category) from Products

-- Q 5. Write a query to find the total (SUM) sales amount for the product with id 7 in the Sales table.

select ProductID,
sum (SaleAmount) from Sales
group by ProductID
Having ProductID= 7

--  6. Write a query to calculate the average (AVG) age of employees in the Employees table.

select avg (Age) from Employees

--7  Write a query that uses GROUP BY to count the number of employees in each department.

Select DepartmentName,
count (EmployeeID) from Employees
group by DepartmentName


--  8. Write a query to show the minimum and maximum Price of products grouped by Category. Use products table.

Select Category,
min (Price),
max (Price) from Products
group by Category


-- Q 9. Write a query to calculate the total (SUM) sales per Customer in the Sales table.

Select CustomerID,
sum (SaleAmount) from Sales
group by CustomerID

--   10. Write a query to use HAVING to filter departments having more than 5 employees from the Employees table.
 -- (DeptID is enough, if you don't have DeptName).

 select DepartmentName,
 count (EmployeeID) from Employees
 group by DepartmentName
 Having count(EmployeeID) > 5

 -- Medium level

 --  11. Write a query to calculate the total sales and average sales for each product category from the Sales table.

 select ProductID,
 sum (SaleAmount), avg (SaleAmount) from Sales
 group by ProductID

--  12. Write a query that uses COUNT(columnname) to count the number of employees from the Department HR.
select DepartmentName,
count (EmployeeID) from Employees
group by DepartmentName
having DepartmentName = 'HR'

--  13. Write a query that finds the highest (MAX) and lowest (MIN) Salary by department in the Employees table.(DeptID is enough, if you don't have DeptName).
 
 Select DepartmentName,
 max (Salary), Min (Salary) from Employees
 group by DepartmentName

   --  14. Write a query that uses GROUP BY to calculate the average salary per Department.

 select DepartmentName,
 avg (Salary) from Employees
 group by DepartmentName

 --

  --  15. Write a query to show the AVG salary and COUNT(*) of employees working in each department.

  select DepartmentName,
 avg (Salary), count (EmployeeID) from Employees
 group by DepartmentName

  --  16. Write a query that uses HAVING to filter products with an average price greater than 400.

 Select Productname,
 avg (Price) from Products
 group by ProductName
 having avg (Price) > 400


 -- -- 17.  Write a query that calculates the total sales for each year in the Sales table, and use GROUP BY to group them.

select Year (Saledate),
sum (SaleAmount) from Sales
group by Year (Saledate)


-- --  18. Write a query that uses COUNT to show the number of customers who placed at least 3 orders.


SELECT COUNT(CustomerID) AS CustomerCount  
FROM (  
    SELECT CustomerID  
    FROM Orders  
    GROUP BY CustomerID  
    HAVING COUNT(OrderID) >= 3  
) AS SubQuery;

-- 
--  19. Write a query that applies the HAVING clause to filter out Departments with total salary expenses greater than 500,000.

select DepartmentName,
sum ( Salary ) from Employees
group by DepartmentName
having sum ( Salary ) > 500000



-- Hard level tasks


-- 20. Write a query that shows the average (AVG) sales for each product category, 
-- and then uses HAVING to filter categories with an average sales amount greater than 200.


SELECT ProductID,  
       AVG(SaleAmount) AS AvgSales  
FROM Sales  
GROUP BY ProductID  
HAVING AVG(SaleAmount) > 200;

-- 21. Write a query to calculate the total (SUM) sales for each Customer, 
--then filter the results using HAVING to include only Customers with total sales over 1500.


Select CustomerID,
sum (SaleAmount) from Sales
group by CustomerID
having sum (SaleAmount) > 1500

--  Q 22. Write a query to find the total (SUM) and average (AVG) salary of employees grouped by department, 
-- and use HAVING to include only departments with an average salary greater than 65000.

select DepartmentName,
sum (Salary), Avg (Salary) from Employees
group by DepartmentName
Having Avg (Salary) > 65000

-- 23. Write a query that finds the maximum (MAX) and minimum (MIN) order value for each customer, 
--and then applies HAVING to exclude customers with an order value less than 50.

select * from Orders

select CustomerID,
max (TotalAmount) , min (TotalAmount) from Orders
group by CustomerID
having min (TotalAmount) >50

-- 24. Write a query that calculates the total sales (SUM) and counts distinct products sold in each month, 
-- and then applies HAVING to filter the months with more than 8 products sold.


SELECT YEAR(SaleDate) AS SalesYear,  
       MONTH(SaleDate) AS SalesMonth,  
       SUM(SaleAmount) AS TotalSales,  
       COUNT(DISTINCT ProductID) AS UniqueProductsSold  
FROM Sales  
GROUP BY YEAR(SaleDate), MONTH(SaleDate)  
HAVING COUNT(DISTINCT ProductID) > 8  
ORDER BY SalesYear, SalesMonth;

-- 25. Write a query to find the MIN and MAX order quantity per Year. From orders table. (Do some research)

select Year (OrderDate),
min (Quantity), Max (Quantity) from Orders
Group by Year (OrderDate)
