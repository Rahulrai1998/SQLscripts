create database GateSmashersTuts
use GateSmashersTuts

create table Employee(
	[id] int identity(1,1) not  null primary key,
	[name] nvarchar(max) not null , 
	[dept] nvarchar(max) not null , 
	[salary] decimal(18,2) not null , 

)

insert into Employee(name,dept,salary) values('abc','bdc',123)

EXEC sp_columns Employee; 
select * from employee;

truncate table employee
rollback

insert into Employee(name , dept , salary) values ('RAM','HR',10000)
insert into Employee(name , dept , salary) values ('AMRIT','MRKT',20000)
insert into Employee(name , dept , salary) values ('RAVI','HR',30000)
insert into Employee(name , dept , salary) values ('NITIN','MRKT',40000)
insert into Employee(name , dept , salary) values ('VARUN','IT',50000)


-- DISPLAY MAXIMUM SALARY FROM EMPLOYEE TABLE
select max(salary) from employee  

-- DISPLAY EMPLOYEE NAME WITH MAXIMUM SALARY
SELECT name from employee where salary = (select max(salary) from employee)

-- DIPLAY SECOND HIGHEST SALARY
select top 1 salary from employee 