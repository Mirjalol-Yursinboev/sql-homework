

-- Q1. Using Products, Suppliers table List all combinations of product names and supplier names.
Select ProductName, SupplierName from Products  join Suppliers on Products.SupplierID = Suppliers.SupplierID

--Q2. Using Departments, Employees table Get all combinations of departments and employees.

Select DepartmentName, Name  from Departments d  join Employees e on d.DepartmentID = e.DepartmentID

-- Q3. Using Products, Suppliers table List only the combinations where the supplier actually supplies the product. 
--Return supplier name and product name

Select SupplierName, ProductName  from Suppliers join Products on Suppliers.SupplierID=Products.SupplierID

--Q4. Using Orders, Customers table List customer names and their orders ID.

Select FirstName,Lastname, OrderID  from Customers c  join Orders o on c.CustomerID=o.CustomerID

--Q5. Using Courses, Students table Get all combinations of students and courses.


Select Name, CourseName from Students join Courses on StudentID=CourseID


--Q6. Using Products, Orders table Get product names and orders where product IDs match.

Select ProductName, OrderID from Products p join Orders o on p.ProductID=o.ProductID

-- Q7.Using Departments, Employees table List employees whose DepartmentID matches the department.

Select Name,DepartmentName from Departments d join Employees e on d.DepartmentID=e.DepartmentID 

-- Q8. Using Students, Enrollments table List student names and their enrolled course IDs

Select Name, CourseID from Students s join Enrollments e on s.StudentID=e.StudentID

-- Q9. Using Payments, Orders table List all orders that have matching payments.


select o.OrderID, PaymentMethod from Payments p join Orders o on p.OrderID = o.OrderID

-- Q10. Using Orders, Products table Show orders where product price is more than 100

Select OrderID,Price from Products p join Orders o on p.ProductID=o.ProductID where Price > 100 


--Q11. Using Employees, Departments table List employee names and department names where department IDs are not equal.
-- It means: Show all mismatched employee-department combinations.

select Name, DepartmentName from Employees e  join Departments d on e.DepartmentID <>d.DepartmentID


--Q 12. Using Orders, Products table Show orders where ordered quantity is greater than stock quantity.


select OrderID, ProductName from Orders o join Products p on  p.ProductID = o.ProductID where o.Quantity > p.StockQuantity

-- Q 13 Using Customers, Sales table List customer names and product IDs where sale amount is 500 or more.


select FirstName, ProductID from Customers c join Sales s on c.CustomerID=s.CustomerID where SaleAmount >=500

--Q 14. Using Courses, Enrollments, Students table List student names and course names they’re enrolled in.


select Name,c.CourseName from Courses c join Enrollments e on c.CourseID=e.CourseID join Students on Students.StudentID=e.StudentID

--Q 15 Using Products, Suppliers table List product and supplier names where supplier name contains “Tech”.


Select ProductName, SupplierName from Products p join Suppliers s on p.SupplierID=s.SupplierID where SupplierName like '%Tech%'

-- Q 16 Using Orders, Payments table Show orders where payment amount is less than total amount.

Select o.OrderID, Amount from Orders o join Payments p on Amount<TotalAmount


-- Q 17 Using Employees table List employee names with salaries greater than their manager’s salary.

SELECT e.Name, e.Salary FROM Employees e JOIN Employees m ON e.ManagerID = m.EmployeeID WHERE e.Salary > m.Salary


-- 18. Using Products, Categories table Show products where category is either 'Electronics' or 'Furniture'.


Select ProductName, CategoryName from Products p join Categories c  on p.Category = c. CategoryID 
where CategoryName  IN ('Electronics', 'Furniture')

-- 19 Using Sales, Customers table Show all sales from customers who are from 'USA'.


select SaleID, Country from Sales s join Customers c on s.CustomerID=c.CustomerID where Country ='USA'

-- 20 Using Orders, Customers table List orders made by customers from 'Germany' and order total > 100.

Select OrderID,Country,TotalAmount from Orders o  join Customers c  on o.CustomerID=c.CustomerID where Country = 'Germany' and TotalAmount > 100

--21 Using Employees table List all pairs of employees from different departments.


SELECT 
    E1.Name AS Employee1,
    E2.Name AS Employee2,
    E1.DepartmentID AS Department1,
    E2.DepartmentID AS Department2
FROM Employees E1
JOIN Employees E2 ON E1.EmployeeID < E2.EmployeeID
WHERE E1.DepartmentID <> E2.DepartmentID;

--22 Using Payments, Orders, Products table List payment details
-- where the paid amount is not equal to (Quantity × Product Price).


Select Amount, Quantity, Price from Payments py join Orders o on o.OrderID = py.orderID join Products pr on o.productID=pr.ProductID
WHERE py.Amount <> (O.Quantity * Pr.Price)

-- 23 Using Students, Enrollments, Courses table Find students who are not enrolled in any course.

Select s. StudentID, s.Name  from Students s left join Enrollments e on s.StudentID = e. StudentID
where e.CourseID is null 

-- 24 Using Employees table List employees who are managers of someone, 
--but their salary is less than or equal to the person they manage.


SELECT Manager.EmployeeID AS ManagerID, Manager.Name AS ManagerName,  Manager.Salary AS ManagerSalary,
   
   Employee.EmployeeID AS EmployeeID, Employee.Name AS EmployeeName, Employee.Salary AS EmployeeSalary
FROM Employees AS Manager
JOIN Employees AS Employee ON Employee.ManagerID = Manager.EmployeeID
WHERE Manager.Salary <= Employee.Salary;

-- 25 Using Orders, Payments, Customers table List customers who have made an order, but no payment has been recorded for it.




Select c.CustomerID, o.OrderID from Customers c  join Orders o on o.CustomerID = c.CustomerID left join Payments p on o.OrderID=p.OrderID where p.OrderID is null


