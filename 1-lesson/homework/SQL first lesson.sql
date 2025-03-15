create -- database,table,schema--

-- SQL language categories--

-- 1. DQL - data query language
-- Select
a) Select 1+2
Select 1+2*5-13/5

b) Select 'Hello World'
--Select 'Hello World'

c) -- select columnnames from table 
 select * from [dbo].[tblGender]

 d) -- @@servername   - server nomini ko'rish uchun

 e) select GETDATE ()
 
 -- 2. DDL-Data Defintion Language

 a) -- Create
 b) -- alter 
 c) -- drop
 d) -- truncate

 -- Create
 create database F24_class1
 create table Students (id int, firstname varchar(50))

 use F24_class1 

 --IT

 create schema IT

 Create table IT.Students (id int, firstname varchar (50))

  Create table HR.Students (id int, firstname varchar (50))
   Create table [Finance_Students] (id int, firstname varchar (50))
 

-- ALTER

alter table Students 
add age int 

Select * from Students
Select id,firstname,age from Students
Select age,id,firstname from Students

Alter table Students
Alter column age varchar (10)

--DROP
drop database [Sample]
drop table [dbo].[Students]

-- drop schema IT

--Truncate 
truncate table          

---- DML - Data Manipulation Language ---

--insert
insert into Students values (1, 'HASAN')
insert into Students values (2,'LI')
insert into Students values (3,'omilbek '),(4,'Shoxrux')
Select * from Students
select *into  Students_copy from Students
drop table Students_copy
--update 
update Students_copy
set firstname ='Komilbek'
where id = 4
select * from Students_copy
insert into values (5, 'Muslima')
insert into Students_copy values (5,'Muslima')


--delete 
-- delete -- row

delete from Students_copy
where id=5

Delete Students_copy
where id>=3

select * from Students_copy


--truncate vs Delete ( without where clause)

-- DCL - Data Control Language

-- Grant 
-- Revoke

--TCL - Transaction Control language 

--begin,rollback,commit


Select * from Students_copy
begin tran

begin tran
create table test1 (id int)

rollback transaction

select * from test
select * from test1

commit


