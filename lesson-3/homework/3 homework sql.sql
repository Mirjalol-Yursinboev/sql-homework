Homework 4

-- 1. Define and explain the purpose of BULK INSERT in SQL Server.

-- Bulk insert is a command in SQL server that allows us to import large amount of data in the format of 
-- csv or txt directly into SQL server efficently and quickly.
-- The purpose of Bulk insert command is to load files into SQL server from external sources.
-- Importing data from spreadsheets or flat files, migrating data between systems, loading data from data warehouses or ETL processes.

 syntax - Bulk insert databasename from path of external file with ( fieldterminator =',', rowterminator='/n', firstrow = 2)

 FIELDTERMINATOR	Specifies the character used to separate fields (e.g., comma ,)
ROWTERMINATOR	Specifies the character used to separate rows (e.g., \n)
FIRSTROW	Specifies the first row to begin reading from (useful for skipping headers)

--2. List four file formats that can be imported into SQL Server.

1. CSV (Comma-Separated Values)

Most commonly used format for bulk data import/export.
Each line represents a row, and values are separated by commas.
2. TXT (Text Files)

Plain text files with customizable delimiters (e.g., tabs, pipes |, etc.).

3. XML (Extensible Markup Language)

Structured data format; SQL Server can parse and import XML using OPENXML or XML data type methods.

4. JSON (JavaScript Object Notation)

Semi-structured format; supported by SQL Server 2016 and above using OPENJSON or JSON_VALUE functions.

--3 3. Create a table Products with columns: 
--ProductID (INT, PRIMARY KEY), ProductName (VARCHAR(50)), Price (DECIMAL(10,2)).

create table Products (ProductID int primary key, ProductName varchar (50),Price decimal (10,2))

--4. Insert three records into the Products table using INSERT INTO.
insert into Products values (1,'apple',250)
insert into Products values (2,'pear',350)
insert into Products values (3,'peach',450)

--5. Explain the difference between NULL and NOT NULL with examples.

NULL
NULL represents missing, unknown, or undefined data in a database.
It means no value has been assigned to that field yet.

NOT NULL
NOT NULL means the column must always have a value.
We cannot insert or update a row without providing a value for this column.

for example:

create table Staff 
(ID int Primary key,Name varchar (20) Not null, Department varchar (20), Phone_number int null)

-- created table above we can see the not null for name that we must insert value to the name column we cannot leave it without any data.
-- on phone number table null function is that we can skip the row for phone number.

-- 6. Add a UNIQUE constraint to the ProductName column in the Products table.

alter table Products
add constraint UQ_proname unique (ProductName)

--7. Write a comment in a SQL query explaining its purpose.
/* In SQL, you can write comments to explain the purpose or logic of a query. 
Comments help improve readability and maintainability */

-- this is for one line comments
/* ...*/ it is for multi - line comments. 

8. Create a table Categories with a CategoryID as PRIMARY KEY and a CategoryName as UNIQUE.

create table Categories ( CategoryID int Primary key, Categoryname varchar (20) Unique)

9. Explain the purpose of the IDENTITY column in SQL Server.

The IDENTITY column in SQL Server is used to automatically generate unique numeric values for a column—typically the primary key.

Auto-incrementing Primary Keys:

Eliminates the need to manually assign unique IDs.
Helps ensure each row has a distinct identifier.
Simplifies Insert Operations:

When inserting data,
you don`t need to specify a value for the identity column—it gets generated automatically.
for example we will create a table with column id 

create table clients
(clientid int identity (1,1) Primary key, name varchar (20), age int, adress varchar (100))

select * from Products

10. Use BULK INSERT to import data from a text file into the Products table.



bulk insert Products from "C:\\Users\\LENOVO\\Desktop\\4,ananas,500.txt" with
(fieldterminator =',', rowterminator='\n', firstrow=1);

select * from categories
select * from Products

--11. Create a FOREIGN KEY in the Products table that references the Categories table.



ALTER TABLE Products
ADD CONSTRAINT fk_procat FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID);

alter table Products
add constraint fk_procat foreign key CategoryID references 

12. Explain the differences between PRIMARY KEY and UNIQUE KEY with examples.

Both PRIMARY KEY and UNIQUE KEY are constraints used in relational databases to enforce uniqueness in columns, 
but they have some key differences.

Primary key Purpose: A PRIMARY KEY uniquely identifies each row in a table. It ensures that no two rows have the same value in the primary key column(s).

Uniqueness: The column(s) defined as a primary key must contain unique values.

Null Values: A primary key column cannot contain NULL values.

Number per Table: A table can have only one primary key.

Indexing: A primary key automatically creates a clustered index (in most databases) for the column(s)
CREATE TABLE students (
    studentID INT PRIMARY KEY,  -- studentID is the primary key
    studentName VARCHAR(50),
    age INT
);
in this table student id is primary key that no students can accept 2 same id numbers and also studentid cannot be null.

 UNIQUE KEY
Purpose: A UNIQUE KEY ensures that all values in a column (or a set of columns) are unique across the table.

Uniqueness: The column(s) defined as a unique key must contain unique values.

Null Values: A unique key column can contain NULL values, but only one row can have a NULL value (depending on the database system).

Number per Table: A table can have multiple unique keys.

Indexing: A unique key automatically creates a non-clustered index (in most databases) for the column(s).

CREATE TABLE employees (
    employeeID INT PRIMARY KEY,  -- employeeID is the primary key
    email VARCHAR(100) UNIQUE,   -- email is a unique key
    phone VARCHAR(15) UNIQUE     -- phone is another unique key
);

In this example:

employeeID is the primary key.

email and phone are unique keys. No two employees can have the same email or phone number, but they can be NULL.



--13. 13. Add a CHECK constraint to the Products table ensuring Price > 0.

select * from Products

alter table Products
add constraint ck_price check (Price>0)

-- 14. Modify the Products table to add a column Stock (INT, NOT NULL).

alter table Products
add  Stock int not null default 0

--15. Use the ISNULL function to replace NULL values in a column with a default value.

UPDATE Products
SET Stock = ISNULL(Stock, 5);

16. Describe the purpose and usage of FOREIGN KEY constraints in SQL Server.

A FOREIGN KEY constraint in SQL Server is used to enforce referential integrity between two tables.
It ensures that the values in a column (or a set of columns) in one table match the values in a column (or a set of columns) in another table.
This creates a relationship between the two tables, typically between a primary key in one table (the referenced table) and a column in another table (the referencing table).

Enforce Referential Integrity:

Ensures that relationships between tables remain consistent.

Prevents orphaned records (e.g., a product cannot belong to a non-existent category).

Maintain Data Consistency:

Ensures that the data in the referencing table (child table) corresponds to the data in the referenced table (parent table).

Define Relationships Between Tables:

Establishes a logical connection between tables, such as one-to-many or many-to-one relationships.

Cascade Actions:

Allows automatic updates or deletions in the child table when the corresponding data in the parent table is updated or deleted.

--17. Write a script to create a Customers table with a CHECK constraint ensuring Age >= 18.

create table Customers (id int, name varchar (20), Age int, constraint chk_age check (Age>=18))

--18. Create a table with an IDENTITY column starting at 100 and incrementing by 10.

create table Identities (id int identity (100,10),name varchar (20), email varchar (20))



--19. Write a query to create a composite PRIMARY KEY in a new table OrderDetails.

create table order_details ( productid int, productprice int, name varchar (20) 
constraint pk_idprice Primary key (productid,productprice))

20. Explain with examples the use of COALESCE and ISNULL functions for handling NULL values.


1. ISNULL Function
The ISNULL function is specific to SQL Server. It replaces NULL with a specified replacement value.

Syntax
sql
Copy
ISNULL(expression, replacement_value)
expression: The column or expression to check for NULL.

replacement_value: The value to return if expression is NULL.

Example
Suppose you have a table Employees with the following data:

EmployeeID	FirstName	LastName	Salary
1	John	Doe	5000.00
2	Jane	Smith	NULL
3	Alice	Johnson	6000.00
You can use ISNULL to replace NULL values in the Salary column with 0:

sql
Copy
SELECT
    EmployeeID,
    FirstName,
    LastName,
    ISNULL(Salary, 0) AS Salary -- Replace NULL with 0
FROM
    Employees;
Output
EmployeeID	FirstName	LastName	Salary
1	John	Doe	5000.00
2	Jane	Smith	0.00
3	Alice	Johnson	6000.00
2. COALESCE Function
The COALESCE function is more versatile and is supported by most SQL databases (e.g., SQL Server, MySQL, PostgreSQL). It returns the first non-NULL value in a list of expressions.

Syntax
sql
Copy
COALESCE(expression1, expression2, ..., expressionN)
expression1, expression2, ..., expressionN: A list of expressions to evaluate. The function returns the first non-NULL value in the list.

Example
Using the same Employees table, you can use COALESCE to replace NULL values in the Salary column with 0:

sql
Copy
SELECT
    EmployeeID,
    FirstName,
    LastName,
    COALESCE(Salary, 0) AS Salary -- Replace NULL with 0
FROM
    Employees;
Output
EmployeeID	FirstName	LastName	Salary
1	John	Doe	5000.00
2	Jane	Smith	0.00
3	Alice	Johnson	6000.00
Key Differences Between ISNULL and COALESCE
Feature	ISNULL	COALESCE
Number of Arguments	Accepts exactly 2 arguments	Accepts multiple arguments
Database Support	SQL Server-specific	Supported by most SQL databases
Return Type	Returns the data type of the first argument	Returns the data type of the first non-NULL argument
Use Case	Simple replacement of NULL	More flexible for handling multiple NULL checks
Advanced Example: Using COALESCE with Multiple Columns
Suppose you have a table Contacts with the following data:

ContactID	Phone	Mobile	Email
1	123-456-789	NULL	john.doe@example.com
2	NULL	987-654-321	NULL
3	NULL	NULL	alice@example.com
You can use COALESCE to return the first non-NULL contact method (Phone, Mobile, or Email):

sql
Copy
SELECT
    ContactID,
    COALESCE(Phone, Mobile, Email, 'No Contact Info') AS ContactInfo
FROM
    Contacts;
Output
ContactID	ContactInfo
1	123-456-789
2	987-654-321
3	alice@example.com

21. Create a table Employees with both PRIMARY KEY on EmpID and UNIQUE KEY on Email.

create table employees (empid int primary key, name varchar (20), email varchar (20)
constraint uk_email unique (email))

22. Write a query to create a FOREIGN KEY with ON DELETE CASCADE and ON UPDATE CASCADE options.

CREATE TABLE Productss (
    ProductID INT PRIMARY KEY,  -- Primary key
    ProductName VARCHAR(50) NOT NULL,
    CategoryID INT,  -- Foreign key column
    CONSTRAINT FK_Products_Categories
        FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
        ON DELETE CASCADE  -- Automatically delete related rows in Products when a row in Categories is deleted
        ON UPDATE CASCADE  -- Automatically update CategoryID in Products when CategoryID is updated in Categories
);