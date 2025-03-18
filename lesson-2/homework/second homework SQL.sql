-- # Lesson 2: DDL and DML Commands

---

-- ### **Basic-Level Tasks (10)**  

-- Question 1. 
-- Create a table `Employees` with columns: `EmpID` INT, `Name` (VARCHAR(50)), and `Salary` (DECIMAL(10,2)).

Create table Employees ( EmpID int, Name varchar (50), Salary decimal (10,2))

-- Question 2. Insert three records into the `Employees` table using different INSERT INTO approaches (single-row insert and multiple-row insert). 
insert into Employees values ( 1, 'Ali', 1500)
insert into Employees values ( 2, 'Vali', 5500)
insert into Employees values ( 3, 'Halim', 1700)

insert into Employees values ( 4, 'Lee', 7060),( 5, 'Xan', 1900),( 6, 'Kim', 10500)

--Q3. Update the `Salary` of an employee where `EmpID = 1`.  
update Employees set Salary = 499 where EmpID =1

-- Q4. Delete a record from the `Employees` table where `EmpID = 2`.  

delete from Employees where EmpID=2

--Q5. Demonstrate the difference between `DELETE`, `TRUNCATE`, and `DROP` commands on a test table.  

create table ##Testable5 ( EmpID int, Name varchar (50), Salary int)
insert into ##Testable5 select * from Employees

Select * from ##Testable5

delete ##Testable5 where Name = 'Lee' 

-- With "Delete" command we can remove only selected values adding with "where" command.

truncate table ##Testable5

-- Truncate allows us to delete only values in table, table itself and column names remain.

drop table ##Testable5

-- Drop totally remove both values of table and itself.

--  6Q. Modify the `Name` column in the `Employees` table to `VARCHAR(100)`.

alter table Employees
alter column Name VARCHAR(100);

--Q7. Add a new column `Department` (`VARCHAR(50)`) to the `Employees` table.  

alter table Employees
add Department varchar (50)

select* from Employees

--Q8. Change the data type of the `Salary` column to `FLOAT`.  
alter table Employees
alter column Salary float

--Q9. Create another table `Departments` with columns `DepartmentID` (INT, PRIMARY KEY) and `DepartmentName` (VARCHAR(50)). 

CREATE TABLE Departments (DepartmentID INT PRIMARY KEY, DepartmentName VARCHAR(50))

--Q10. Remove all records from the `Employees` table without deleting its structure.  

truncate table Employees


-- Q11. Insert five records into the `Departments` table using `INSERT INTO SELECT` from an existing table.

insert into Departments  select * from Departments2
Select * from Departments
Select * from Departments2

--Q12. Update the `Department` of all employees where `Salary > 5000` to 'Management'.  

select * from Employees
insert into Employees values ( 1, 'Ali', 1500, 'HR')
insert into Employees values ( 2, 'Vali', 5500, 'Admission')
insert into Employees values ( 3, 'Halim', 1700, 'Security')

insert into Employees values ( 4, 'Lee', 7060, 'Finance'),( 5, 'Xan', 1900,'Catering'),( 6, 'Kim', 10500, 'IT')

Update Employees
set Department = 'Management' Where Salary > 5000

--Q13. Write a query that removes all employees but keeps the table structure intact.   

truncate table Employees

--14. Drop the `Department` column from the `Employees` table

alter table Employees
drop column Department

--Q 15 Rename the `Employees` table to `StaffMembers` using SQL commands.  

sp_rename 'Employees', 'StaffMembers'


 --Q 16 Write a query to completely remove the `Departments` table from the database. 
 
 drop table Departments

 --Q17. Create a table named Products with at least 5 columns, 
 -- including: ProductID (Primary Key), ProductName (VARCHAR), Category (VARCHAR), Price (DECIMAL)

 create table Products (ProductID int Primary Key, ProductName VARCHAR(50), Category VARCHAR(50), Price DECIMAL) 

 --Q18. Add a CHECK constraint to ensure Price is always greater than 0.

 ALTER TABLE Products
ADD CONSTRAINT chk_price_positive CHECK (Price > 0);

--19. Modify the table to add a StockQuantity column with a DEFAULT value of 50.

alter table Products
add StockQuantity int default 50

-- 20. Rename Category to ProductCategory

EXEC sp_rename 'Products.Category', 'ProductCategory', 'COLUMN';


select * from Products

--21. Insert 5 records into the Products table using standard INSERT INTO queries.

insert into Products  values (1, 'Apple', 'Fruits',2500)
insert into Products  values (2, 'Milk', 'Dairy',7600)
insert into Products  values (3, 'Rice', 'Grain',15000)
insert into Products  values (4, 'Egg', 'Protein',2000)
insert into Products  values (5, 'Nuts', 'Snack',5900)


--22. Use SELECT INTO to create a backup table called Products_Backup containing all Products data.

select * into Products_backup from Products

-- 23. Rename the Products table to Inventory.

sp_rename 'Products', 'Inventory'

-- 24. Alter the Inventory table to change the data type of Price from DECIMAL(10,2) to FLOAT.

alter table Inventory
alter column Price float

-- 25. Add an IDENTITY column named ProductCode that starts from 1000 and increments by 5.

create table inventory_2  ( ProductCode int Identity (1000,5) primary key, ProductName VARCHAR(100),
    Price FLOAT,
    StockQuantity INT)



