Homework 1.

-- Question 1. Define the following terms: data, database, relational database, and table.

--ANSWER - Data is a row material that, we cannot use it during the process of decision - making, relying on data. For instance, name, ID number, Address and so on. these datas do not make big sense before cleaning and analysing.
         -- Database is the collection of data in electronic format for easy access. And We can manage it remove or insert inputs or datas. SQL databases usually consists of diagrams, tables, views. 
		 -- Relational Database is this kind of database that there are 2 or more than 3 similar tables, because of the being almost the same of tables' model and principles, alllows to use SQL.
		 -- Table consists of colums and rows. it is used for inserting data. when we write query on sql the result of it appear on table.

--Question 2.List five key features of SQL Server

-- ANSWER  1. Data Querying. this feature allows us to retrive data, combine, filter, and sort them. With such kind of queries for example "Select", "Order by", "Where", "Join" we can do the actions.
        -- 2. Data Manipulation. We can insert, delete, update the data to database commanding "Insert", "Update", "Delete" statements.
		-- 3. Data Definition. this function of SQL allows us creating tables, views, schemas and changing datas column names removing datas from tables, by writing the commands like "Create", "Alter", "Drop"
		-- 4. Data Control. on SQL we can control our database allowing the other administrators particular access or terminating them. in this case we can use "Grant" (giving acess), and "revoke" (restricting access).
		-- 5. Transaction Control. SQL supports managing groups of operations as single units using transactions. Commands like BEGIN, COMMIT, and ROLLBACK ensure data integrity, especially in multi-user environments.

--Question 3. What are the different authentication modes available when connecting to SQL Server? (Give at least 2)

 -- ANSWER. The authentication modes make sense when we are connecting to our local server from our computer. in this case we can select Windows Authentication. it is more secure and doesnot need to username and password if we already logged in.
            -- second one is SQL authentication. when a lot of users are working in one project, username and password will be given for each user and their credentials are not part of Windows Domain.

--Question 4. Create a new database in SSMS named SchoolDB.
 
 -- ANSWER:
 create database SchoolDB
            
-- Question 5. Write and execute a query to create a table called Students with columns: StudentID (INT, PRIMARY KEY), Name (VARCHAR(50)), Age (INT).
create table Students (StudentID int Primary key, Name varchar(50), Age int )

--Question 6. Describe the differences between SQL Server, SSMS, and SQL.
 
 -- ANSWER. SQL is Structured Query Language. it is just a programming language to write query and manipulate the data.
          -- SQL Server is a software system powered by Microsoft. this Database and Management system stores and processes the data.
		  -- SSMS (SQL Server Management Studio) is a management tool that visualize the data processed on SQL server. in additon, it helps to configure servers, manage datas.

--Question 7. Research and explain the different SQL commands: DQL, DML, DDL, DCL, TCL with examples.

-- ANSWER. As I mentioned these theory of commands question 2 above I am gonna explain them with example.

1. -- DQL. Data Query Language. Command is Select.

-- For example:
Select * from Students

2. -- DML Data Manipulation Language. Commands are Insert, Update, Delete, Merge.

insert into Students values (1,'Alex',25)

delete from Students where StudentID=1

update Students set Name = 'John' where StudentID=1

3. -- DDL Data Definition Language. Commands are Create, Alter, Drop, Truncate

create table employees_of_akfa ( EmployeeID int, Name varchar (20), Department varchar (20),Age int)
ALTER TABLE employees_of_akfa DROP COLUMN Age;

select * from employees_of_akfa

4. DTL -- Data Control Language. Commands are Grant, Revoke.

GRANT SELECT, INSERT ON employees TO 'user1'
REVOKE INSERT ON employees FROM 'user1'

5. TCL -- Transaction Control Language. Commands are Commit, Rollback, Savepoint, Begin.

-- commit - save all changes made during current transaction
-- rollback - undo all changes made during current transaction
-- savepoint- Sets a savepoint within a transaction to which you can later roll back.

begin tran
insert into Students values (10, 'key',13)

select * from Students
rollback tran

-- Question 8. Write a query to insert three records into the Students table.
--Answer:

select * from Students
insert into Students values ( 2,'Lee',24)
insert into Students values ( 3,'Sin',29)
insert into Students values ( 4,'Ali',20)
insert into Students values ( 5,'Hoshim', 35)

-- Question 9. Create a backup of your SchoolDB database and restore it. (write its steps to submit)

-- Answer: 
BACKUP DATABASE SchoolDB
TO DISK = 'C:\Backup\SchoolDB.bak'
WITH FORMAT, INIT;