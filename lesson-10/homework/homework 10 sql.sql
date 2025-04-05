--q1 Using the Employees and Departments tables, write a query to return the names and salaries of employees 
--whose salary is greater than 50000, along with their department names.
--🔁 Expected Output: EmployeeName, Salary, DepartmentName


Select Name, Salary, DepartmentName from Employees e join Departments d on d.DepartmentID = e.DepartmentID
where Salary >50000

--q2 Using the Customers and Orders tables, write a query to display customer names and order dates for orders placed
--in the year 2023.🔁 Expected Output: FirstName, LastName, OrderDate


Select FirstName, LastName, OrderDate from Customers c  join Orders o on c.CustomerID=c.CustomerID 
where Year (OrderDate) = 2023

--q3 Using the Employees and Departments tables, write a query to show all employees along with their department names. Include employees who do not belong to any department.
-- 🔁 Expected Output: EmployeeName, DepartmentName (Hint: Use a LEFT OUTER JOIN)


Select Name, DepartmentName  from Employees e left join Departments d on e.DepartmentID = d.DepartmentID

-- Q4 Using the Products and Suppliers tables, write a query to list all suppliers and the products they supply. 
--Show suppliers even if they don’t supply any product. 🔁 Expected Output: SupplierName, ProductName


Select SupplierName, ProductName from Products p right join Suppliers s on p.SupplierID=s.SupplierID

-- q5 Using the Orders and Payments tables, write a query to return all orders and their corresponding payments. 
--Include orders without payments and payments not linked to any order.
--Expected Output: OrderID, OrderDate, PaymentDate, Amount


Select o.OrderID, OrderDate, PaymentDate, Amount from Orders o full join Payments p on p.OrderID = o.OrderID


-- Q6 Using the Employees table, write a query to show each employee's name along with the name of their manager.
-- 🔁 Expected Output: EmployeeName, ManagerName

SELECT e.Name AS EmployeeName, m.Name AS ManagerName
FROM Employees e
LEFT JOIN Employees m ON e.ManagerID = m.EmployeeID;

--q7 Using the Students, Courses, and Enrollments tables, write a query to list the names of students 
-- who are enrolled in the course named 'Math 101'. 🔁 Expected Output: StudentName, CourseName


SELECT s.Name, c.CourseName
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
WHERE c.CourseName = 'Math 101';

--Q8 Using the Customers and Orders tables, write a query to find customers who have placed an order with more than 3 items. 
-- Return their name and the quantity they ordered. 🔁 Expected Output: FirstName, LastName, Quantity

Select FirstName, LastName, Quantity from Customers c join Orders o on c.CustomerID= o.CustomerID where Quantity >2

--Q9  Using the Employees and Departments tables, write a query to list employees working in the 'Human Resources' department.
-- Expected Output: EmployeeName, DepartmentName


Select Name, DepartmentName from Employees e join Departments d on e.DepartmentID = d.DepartmentID where d.DepartmentName = 'Human Resources'

-- q10 Using the Employees and Departments tables, write a query to return department names that have more than 10 employees.
-- Expected Output: DepartmentName, EmployeeCount

Select d.DepartmentName, count (e.DepartmentID) as EmployeeCount from Employees e join Departments d on e.DepartmentID = d.DepartmentID 

group by d.DepartmentName
having count (e.DepartmentID)>10


-- q 11 Using the Products and Sales tables, write a query to find products that have never been sold.
-- 🔁 Expected Output: ProductID, ProductName

Select p.ProductID, ProductName from Products p left join Sales s  on p.ProductID=s.ProductID where s.productID is null

--q 12 Using the Customers and Orders tables, write a query to return customer names who have placed at least one order.
--Expected Output: FirstName, LastName, TotalOrders


SELECT FirstName, LastName, COUNT(o.OrderID) AS TotalOrders
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY FirstName, LastName;

--Q 13 Using the Employees and Departments tables, write a query to show only those records 
--where both employee and department exist (no NULLs). Expected Output: EmployeeName, DepartmentName


Select Name, DepartmentName from Employees e join Departments d on  e.DepartmentID = d.DepartmentID

-- q14 Using the Employees table, write a query to find pairs of employees who report to the same manager.
 Expected Output: Employee1, Employee2, ManagerID

 SELECT e1.Name AS Employee1, e2.Name AS Employee2, e1.ManagerID
FROM Employees e1
JOIN Employees e2 ON e1.ManagerID = e2.ManagerID
WHERE e1.EmployeeID <> e2.EmployeeID;

-- Q 15 Using the Orders and Customers tables, write a query to list all orders placed in 2022 along with the customer name.
  Expected Output: OrderID, OrderDate, FirstName, LastName

 

  Select  OrderID, OrderDate, FirstName, LastName from Orders o join Customers c on o.CustomerID= c.CustomerID where year (OrderDate)=2022

  -- Q 16 Using the Employees and Departments tables, write a query to return employees from the 'Sales' department 
   --  whose salary is above 60000. Expected Output: EmployeeName, Salary, DepartmentName


   Select Name, Salary,DepartmentName from Employees e join Departments d on e.DepartmentID = d.DepartmentID where DepartmentName = 'Sales' and Salary >60000

 -- Q 17 Using the Orders and Payments tables, write a query to return only those orders that have a corresponding payment.
--  Expected Output: OrderID, OrderDate, PaymentDate, Amount

   Select  o.OrderID, OrderDate, PaymentDate, Amount from Orders o join Payments p on o.OrderID = p. OrderID 


   -- q 18 Using the Products and Orders tables, write a query to find products that were never ordered.
   --Expected Output: ProductID, ProductName

   
   Select p.ProductID, ProductName from Products p left join Orders o on p.ProductID = o.ProductID where o.ProductID is null

-- Q 20 Using the Employees table, write a query to find employees whose salary is greater than the average salary of all employees.
-- Expected Output: EmployeeName, Salary

Select Name, Salary 
from Employees where Salary > (Select Avg (Salary) from Employees)

-- Q 21 Using the Orders and Payments tables, write a query to list all orders placed before 2020 that have no corresponding payment.
-- Expected Output: OrderID, OrderDate

SELECT 
    o.OrderID, 
    o.OrderDate FROM Orders o LEFT JOIN Payments p ON o.OrderID = p.OrderID
WHERE p.OrderID IS NULL 
  AND o.OrderDate < '2020-01-01'

  -- Q 22 Using the Products and Categories tables, write a query to return products that do not have a matching category.
 -- Expected Output: ProductID, ProductName

 SELECT 
    p.ProductID, 
    p.ProductName
FROM Products p
LEFT JOIN Categories c ON p.Category = c.CategoryID
WHERE c.CategoryID IS NULL;

-- q 23 Using the Employees table, write a query to find employees who report to the same manager and earn more than 60000.
-- Expected Output: Employee1, Employee2, ManagerID, Salary

SELECT 
    e1.Name AS Employee1,
    e2.Name AS Employee2,
    e1.ManagerID,
    e1.Salary AS Salary1,
    e2.Salary AS Salary2
FROM Employees e1
JOIN Employees e2 
    ON e1.ManagerID = e2.ManagerID
    AND e1.EmployeeID < e2.EmployeeID
WHERE e1.Salary > 60000 AND e2.Salary > 60000;

-- Q 24 Using the Employees and Departments tables, write a query to return employees who work in departments whose name starts with the letter 'M'.
 -- Expected Output: EmployeeName, DepartmentName

 SELECT 
    e.Name AS EmployeeName,
    d.DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName LIKE 'M%';

--Q 25 Using the Products and Sales tables, write a query to list sales where the amount is greater than 500, including product names.
--  Expected Output: SaleID, ProductName, SaleAmount
SELECT 
    s.SaleID,
    p.ProductName,
    s.SaleAmount
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
WHERE s.SaleAmount > 500;

-- Q 26 Using the Students, Courses, and Enrollments tables, write a query to find students who have not enrolled in the course 'Math 101'.
-- Expected Output: StudentID, StudentName
SELECT s.StudentID, s.Name AS StudentName
FROM Students s
WHERE s.StudentID NOT IN (
    SELECT e.StudentID
    FROM Enrollments e
    JOIN Courses c ON e.CourseID = c.CourseID
    WHERE c.CourseName = 'Math 101'

	--  q27 Using the Orders and Payments tables, write a query to return orders that are missing payment details.
-- Expected Output: OrderID, OrderDate, PaymentID

SELECT o.OrderID, o.OrderDate, p.PaymentID
FROM Orders o
LEFT JOIN Payments p ON o.OrderID = p.OrderID
WHERE p.PaymentID IS NULL;

-- Q  28 Using the Products and Categories tables, write a query to list products that belong to either the 'Electronics' or 'Furniture' category.
-- Expected Output: ProductID, ProductName, CategoryName

SELECT p.ProductID, p.ProductName, c.CategoryName
FROM Products p
JOIN Categories c ON p.Category = c.CategoryID
WHERE c.CategoryName IN ('Electronics', 'Furniture');










 



