
select * from Products
select * from Products_Discounted
select * from Customers

--Q1 Write a query that uses an alias to rename the ProductName column as Name in the Products table.

select ProductName as Name from Products

--Q2  Write a query that uses an alias to rename the Customers table as Client for easier reference.

select * from Customers as Client

-- Q3 Use UNION to combine results from two queries that 
--select ProductName from Products and ProductName from Products_Discounted.

select ProductName from Products
union
select ProductName from Products_Discounted

-- Q4 Write a query to find the intersection of Products and Products_Discounted tables using INTERSECT.

Select ProductID,ProductName,Price,Category, StockQuantity from Products 
intersect
Select ProductID,ProductName,Price,Category, StockQuantity from Products_Discounted

or 
Select * from Products
intersect
Select * from Products_Discounted

--Q 6 Write a query to select distinct customer names and their corresponding Country using SELECT DISTINCT.

select distinct FirstName, Country from Customers

--Q 7 Write a query that uses CASE to create a conditional column that displays 
--'High' if Price > 1000, and 'Low' if Price <= 1000 from Products table.

select *, 
case 
when Price > 1000 then 'High'
else 'low'
end

from Products 

-- Q8 Use IIF to create a column that shows 'Yes' if Stock > 100, and 'No' 
--otherwise (Products_Discounted table, StockQuantity column)

select*,  

iif (StockQuantity > '100', 'Yes','No')
from Products_Discounted



--Q 9. Use UNION to combine results from two queries that 
--select ProductName from Products and ProductName from OutOfStock tables

Select * from Products
union
select * from OutOfStock


-- Q 10. Write a query that returns the difference between the Products and Products_Discounted tables using EXCEPT.

Select * from Products
except
Select * from Products_Discounted

--Q11. Create a conditional column using IIF that shows 'Expensive' if the Price is greater than 1000, 
--and 'Affordable' if less, from Products table.

select*,
iif (Price > 1000, 'Expensive','Affordable')
from Products 

-- Q 12. 12. Write a query to find employees in the Employees table
-- who have either Age < 25 or Salary > 60000.

Create table
Employees (Emp_ID int Primary key, 
fullname varchar (20), Department varchar ( 50), 
Salary int, Age int)

INSERT INTO Employees (Emp_ID, FullName, Department, Salary, Age) VALUES
(1, 'Alice Johnson', 'HR', 50000, 30),
(2, 'Bob Smith', 'IT', 70000, 28),
(3, 'Charlie Brown', 'Finance', 65000, 35),
(4, 'David Lee', 'Marketing', 55000, 29),
(5, 'Emma Davis', 'HR', 52000, 32),
(6, 'Frank Wilson', 'IT', 72000, 27),
(7, 'Grace Miller', 'Finance', 68000, 40),
(8, 'Henry White', 'Marketing', 57000, 22),
(9, 'Ivy Scott', 'HR', 51000, 26),
(10, 'Jack Green', 'IT', 75000, 33),
(11, 'Katie Lewis', 'Finance', 69000, 38),
(12, 'Liam Walker', 'Marketing', 56000, 29),
(13, 'Mia Adams', 'HR', 53000, 24),
(14, 'Noah Carter', 'IT', 71000, 30),
(15, 'Olivia Hall', 'Finance', 67000, 36),
(16, 'Paul Turner', 'Marketing', 58000, 23),
(17, 'Quinn Baker', 'HR', 54000, 29),
(18, 'Ryan Collins', 'IT', 73000, 31),
(19, 'Sophia Edwards', 'Finance', 66000, 33),
(20, 'Tom Harris', 'Marketing', 59000, 28);

select * from Employees

where Age < 25 or Salary > 60000

-- 13 Q. Use IF statement to update the salary of an employee based on their department,
--increase by 10% if they work in 'HR' or EmployeeID = 5

DECLARE @Salary INT;

SELECT @Salary = Salary FROM Employees WHERE Emp_ID = 5;

IF (EXISTS (SELECT 1 FROM Employees WHERE Emp_ID = 5 AND Department = 'IT'))
BEGIN
    UPDATE Employees
    SET Salary = @Salary * 1.10
    WHERE Emp_ID = 5;
END

-- Q 14 Use INTERSECT to show products that are common between Products and Products_Discounted tables.

Select ProductID,ProductName,Price,Category, StockQuantity from Products 
intersect
Select ProductID,ProductName,Price,Category, StockQuantity from Products_Discounted

or 
Select * from Products
intersect
Select * from Products_Discounted

/* Q15 Write a query that 
uses CASE to assign 'Top Tier' if SaleAmount > 500, 'Mid Tier' if SaleAmount BETWEEN 200 AND 500,
and 'Low Tier' otherwise. (From Sales table)*/

Select *,
case 
when SaleAmount > 500 then  'Top Tier'
when SaleAmount Between 200 and 500 then ' Mid  Tier'
else 'Low Tier'
end
from Sales

-- Q 16 16. Use EXCEPT to find customers' 
-- ID who have placed orders but do not have a corresponding record in the Invoices table.

Select  CustomerID from Orders
except 
Select CustomerID from Invoices


/* 17. Write a query that 
uses a CASE statement to determine the discount percentage 
based on the quantity purchased. 
Use orders table. 
Result set should show  customerid, quantity and discount percentage. 
The discount should be applied as follows:
        More than 1 item: 3% 
        Between 1 and 3 items : 5% 
        Otherwise: 7% 
*/

select * from Orders



SELECT CustomerID, Quantity,  
    CASE  
        WHEN Quantity = 1 THEN '3%'  
        WHEN Quantity BETWEEN 2 AND 3 THEN '5%'  
        ELSE '7%'  
    END AS [Discount Percentage]  
FROM Orders;
