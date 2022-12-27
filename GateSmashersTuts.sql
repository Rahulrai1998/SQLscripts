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
begin transaction
insert into Employee(name , dept , salary) values ('RAM','HR',10000)
insert into Employee(name , dept , salary) values ('AMRIT','MRKT',20000)
insert into Employee(name , dept , salary) values ('RAVI','HR',30000)
insert into Employee(name , dept , salary) values ('NITIN','MRKT',40000)
insert into Employee(name , dept , salary) values ('VARUN','IT',50000)
insert into Employee(name , dept , salary) values ('PRIYA','SALES',60000)
insert into Employee(name , dept , salary) values ('ALOK','MRKT',15000)
insert into Employee(name , dept , salary) values ('ZARA','IT',25000)


rollback


-- DISPLAY MAXIMUM SALARY FROM EMPLOYEE TABLE
select max(salary) from employee  

-- DISPLAY EMPLOYEE NAME WITH MAXIMUM SALARY
SELECT name from employee where salary = (select max(salary) from employee)

-- DIPLAY SECOND HIGHEST SALARY
select top 1 salary from employee where salary < (select top 1 salary from employee order by  salary desc) order by salary desc
select max(salary)  from employee where salary <> (select max(salary) from employee)

-- DISPLAY EMPLOYEE NAME HAVING SECOND HIGHEST SALARY
select name from employee where salary = (select max(salary)  from employee where salary <> (select max(salary) from employee))

-- DIPLAY ALL THE DEPARTMENT NAMES ALONGWITH THE NUMBER OF EMPLOYEES IN THEM
select count(name) from employee -- returns total nummber of rows in 
select dept , count(dept)  from employee  group by dept

-- DIPLAY ALL THE DEPARTMENT NAMES WHERE NUMBER OF EMPLOYEES ARE LESS THAN 2
SELECT dept from employee 
group by dept having count(*)<2

-- DISPLAY NAMES IN ABOVE DEPARTMENTS

SELECT name from employee
where dept = (SELECT dept from employee group by dept having count(*)=2)

-- DISPLAY HIGHEST SALARY DEPARTMENT-WISE AND  NAME OF THE EMPLOYEE WHO IS TAKING THAT SALARY

SELECT name , salary FROM employee where salary 
in (select MAX(salary) from employee group by dept)

