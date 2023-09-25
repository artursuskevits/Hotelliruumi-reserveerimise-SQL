	--39.

	Create table DimEmployee4 
	(id int primary key,
	name varchar (50),
slary int,
gender varchar (50),
departmentid int);

Create table Department 
(deptid int primary key ,
deptname varchar(20)
);

insert into DimEmployee4  Values(1,'Martin',4800,'Male','3')
insert into DimEmployee4  Values(2,'Alisa',1800,'Female','2')
insert into DimEmployee4  Values(3,'Andrey',3800,'Male','1')
insert into DimEmployee4  Values(4,'Vlad',2800,'Male','3')
insert into DimEmployee4  Values(5,'Maksos',800,'Male','2')

insert into Department Values (1,'It')
insert into Department Values (2,'Admin')
insert into Department Values (3,'Hr')
select * from Department;
select * from DimEmployee4;


SELECT e.id, e.name, e.slary, e.gender, d.deptname
FROM DimEmployee4 e
JOIN Department d ON e.departmentid = d.deptid;

Create view vWemplyeesbydepartment
as 
select id,name,slary,gender,deptname
from DimEmployee4
join Department
on DimEmployee4.departmentid = Department.deptid

select * from vWemplyeesbydepartment


Create view vWITDepartament_Employees
as 
SELECT id, name, slary, gender, deptname
FROM DimEmployee4
JOIN Department ON DimEmployee4.departmentid = Department.deptid
WHERE Department.deptname = 'It';


select * from vWITDepartament_Employees

Create view vWemplyeesnonconfidentialdata
as 
SELECT id, name, gender, deptname
FROM DimEmployee4
JOIN Department 
ON DimEmployee4.departmentid = Department.deptid

select * from vWemplyeesnonconfidentialdata

Create view vWemployeesCountByDepartment
as 
SELECT deptname,COUNT(id) as TotalEmployees
FROM DimEmployee4
JOIN Department 
ON DimEmployee4.departmentid = Department.deptid
group by deptname

select * from vWemployeesCountByDepartment
	

---40 View uuendused
Create view vwemployeesDataEXceptSalary
as
Select id, name,gender,departmentid
from DimEmployee4

select * from vwemployeesDataEXceptSalary

Update vwemployeesDataEXceptSalary
Set name ='Mikey' where id = 2

Delete from vwemployeesDataEXceptSalary where id =2 
insert into vwemployeesDataEXceptSalary values(2,'Mikey','Male',2)

Create view vWemplyeesbydepartment
as 
select id,name,slary,gender,deptname
from DimEmployee4
join Department
on DimEmployee4.departmentid = Department.deptid

select * from vWemplyeesbydepartment

update vWemplyeesbydepartment
set deptname='It'where name ='Jhon'
