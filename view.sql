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

---41. Indekseeritud view-d
Create table Product
(Product int primary key,
name varchar(50),
unitprice int);


insert into Product values(1,'Book',20)
insert into Product values(2,'Clips',20)
insert into Product values(3,'Pens',20)
insert into Product values(4,'Penil',20)

Create table productsales(
Productid int,
QuantitySold int 
)

Insert into productsales values(1,12)
Insert into productsales values(2,14)
Insert into productsales values(3,2)
Insert into productsales values(4,32)
Insert into productsales values(1,25)
Insert into productsales values(2,15)
Insert into productsales values(3,32)
Insert into productsales values(4,22)
Insert into productsales values(1,12)
Insert into productsales values(2,22)

Create view vWTotalSalesbyproduct 
with SchemaBinding
as
Select Name,
Sum(ISNull((QuantitySold*unitprice),0)) as TotalSales,
Count_big(*) as TotalTarnsaction
from dbo.productsales
join dbo.Product
on dbo.Product.Product = dbo.productsales.Productid
group by name

select * from vWTotalSalesbyproduct

Create Unique Clustered INdex UIx_vWTotalSalesbyproduct_Name
on vWTotalSalesbyproduct(name)

--42. View piirangud

Select * from DimEmployee4

-- Error : Cannot pass Parameters to Views 
Create View vWEmployeeDetails
@Gender nvarchar(20)
as
Select id, name, gender, departmentId
from  DimEmployee4
where gender = @Gender


Create function fnEmployeeDetails(@Gender nvarchar(20))
Returns Table
as
Return 
(Select id, name, gender, departmentid
from DimEmployee4 where gender = @Gender)

Select * from dbo.fnEmployeeDetails('Male')

Create View vWEmployeeDetailsSorted
as
Select id, name, gender, departmentid
from DimEmployee4
order by id

Create Table ##TestTempTable(Id int, Name nvarchar(20), Gender nvarchar(10))

Insert into ##TestTempTable values(101, 'Martin', 'Male')
Insert into ##TestTempTable values(102, 'Joe', 'Female')
Insert into ##TestTempTable values(103, 'Pam', 'Female')
Insert into ##TestTempTable values(104, 'James', 'Male')

Select * from ##TestTempTable

Create View vwOnTempTable
as
Select Id, Name, Gender
from ##TestTempTable

