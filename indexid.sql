--Funkts. loomine 32
create function fn_iltvf_getemplyees()
returns table
as
return (Select EmployeeKey, FirstName,CASt(BirthDate as DAte) as Dob from DimEmployee)
SELECT *
FROM fn_iltvf_getemplyees();

Create Function fn_mstvf_GetEmployless()
Returns @Table Table (EmployeeKey int, FirstName nvarchar(20),DOB Date)
as
BEgin
Insert into @Table
Select EmployeeKey,FirstName,CASt(BirthDate as DAte)
from DimEmployee
Return
End

Select * from DimEmployee;
Select * from fn_mstvf_GetEmployless()

Update fn_iltvf_getemplyees() set FirstName='Artur' Where EmployeeKey = 1

Update fn_mstvf_GetEmployless() set FirstName='Artur' Where EmployeeKey = 1

--Funkts. loomine 33
Create Function fn_getemployeenamebild(@id int)
Returns nvarchar(20)
as
Begin
REturn (Select FirstName from DimEmployee Where EmployeeKey = @id)
end

 select dbo.fn_getemployeenamebild(1);

exec fn_getemployeenamebild @id=1;


Alter function fn_getemployeenamebild(@id int)

Returns nvarchar(20)
With Encryption 
as
begin
return(Select FirstName from dbo.DimEmployee where EmployeeKey =@id )
end

select dbo.fn_getemployeenamebild(1);

sp_helptext fn_getemployeenamebild;

Alter function fn_getemployeenamebild(@id int)

Returns nvarchar(20)
With SchemaBinding
as
begin
return(Select FirstName from dbo.DimEmployee where EmployeeKey =@id )
end

select dbo.fn_getemployeenamebild(1);

Drop table DimEmployee;


--Ajutised tabelid 34
Create Table #PersonDetails(Id int, Name nvarchar(20))

select * from DimEmployee;

Insert into #PersonDetails VAlues(1,'Vlad');
Insert into #PersonDetails VAlues(2,'Vladik');
Insert into #PersonDetails VAlues(3,'Artur');

select * from #PersonDetails;

USE tempdb; 
GO

SELECT name
FROM sys.objects
WHERE name LIKE '#PersonDetails%'


select name from tempdb.sys.all.objects
where name like '#PersonDetails%'

DROP TABLE #PersonDetails

create procedure splcreatelocaltemptable
as begin
Create Table #PersonDetails(Id int, Name nvarchar(20))

Insert into #PersonDetails VAlues(1,'Vlad');
Insert into #PersonDetails VAlues(2,'Vladik');
Insert into #PersonDetails VAlues(3,'Artur');

select * from #PersonDetails;
 end

 exec splcreatelocaltemptable

 Create Table ##EmployeeDetalis(Id int, Name nvarchar(20))
 Select * from  ##EmployeeDetalis

 select * from DimEmployee;

--35. Ineksid serveris

Create Table DimEmployeeWsSalary
(id int identity(1,1),
Name varchar(40),
Salary int,
Gender varchar(40));

INsert into DimEmployeeWsSalary Values('Vald',1800,'Male')
INsert into DimEmployeeWsSalary Values('Artur',2500,'Male')
INsert into DimEmployeeWsSalary Values('Jan',1000,'Male')
INsert into DimEmployeeWsSalary Values('Genadiy',6000,'Male')
INsert into DimEmployeeWsSalary Values('Zenaida',4000,'Female')

Select * from DimEmployeeWsSalary

Select * from DimEmployeeWsSalary where Salary > 2000 and Salary < 5000

Create Index Ix_tblemplyee_salary
on DimEmployeeWsSalary (SALARY ASC)


Drop index DimEmployee.FirstName_LastName;
exec sys.sp_helpindex @objname = 'DimEmployee' 
--36. Klastreeritud ja mitte-klastreeritud indeksid
Create table DimEmmplyee2
(
id int primary key,
name varchar (50),
slary int,
gender varchar (50),
city varchar (50)
);

insert into DimEmmplyee2 Values(3,'Vald',700,'Male','NewYork')
insert into DimEmmplyee2 Values(4,'Artem',4700,'Male','Sidney')
insert into DimEmmplyee2 Values(2,'Nikita',3700,'Male','Tallinn')
insert into DimEmmplyee2 Values(1,'Andreii',2700,'Male','Tappa')
insert into DimEmmplyee2 Values(5,'Mikhail',1700,'Male','Moscow')

Select * from DimEmmplyee2

Create clustered index IX_tblEmployee_Name
on DimEmployee(FirstName)

Drop index PK_DimEmployee_EmployeeKey

Create clustered index IX_tblEmployee_Gender_Salary
on DimEmmplyee2(gender desc, slary asc)

Create nonclustered index IX_tblEmployee_Name
on DimEmmplyee2(name)

--37. Unikaalne ja mitte-unikaalne indeks
Create table DimEmmplyee3 
(id int primary key,
firstname varchar (50),
lastname varchar (50),
slary int,
gender varchar (50),
city varchar (50));

execute sp_helpindex DimEmmplyee3 

insert into DimEmmplyee3 Values(1,'Vald','Ivanov',800,'Male','NewYork')
insert into DimEmmplyee3 Values(1,'Vald','Artemov',700,'Male','NewYork')

Drop index PK__DimEmmpl__3213E83F895E8598


insert into DimEmmplyee3 Values(1,'Vald','Ivanov',800,'Male','NewYork')
insert into DimEmmplyee3 Values(1,'Vald','Artemov',700,'Male','NewYork')

Select * from DimEmmplyee3

delete from DimEmmplyee3 where id = 1;  
Create Unique NonClustered Index UIX_tblEmployee_FirstName_LastName
On DimEmmplyee3(FirstName, LastName)

ALTER TABLE DimEmmplyee3
ADD CONSTRAINT UQ_tblEmployee_City 
UNIQUE NONCLUSTERED (city)

EXECUTE SP_HELPCONSTRAINT DimEmmplyee3;


CREATE UNIQUE INDEX DimEmmplyee3
ON DimEmmplyee3(city)
WITH IGNORE_DUP_KEY
 
--38. Indeksi plussid ja miinused
Drop table DimEmmplyee3;

Create table DimEmmplyee3 
(id int primary key,
firstname varchar (50),
lastname varchar (50),
slary int,
gender varchar (50),
city varchar (50));

insert into DimEmmplyee3 Values(1,'Martin','Ivanov',800,'Male','NewYork')
insert into DimEmmplyee3 Values(2,'Maksos','Ańdreev',2800,'Female','NewYork')
insert into DimEmmplyee3 Values(3,'Andrei','Valdov',3800,'Male','NewYork')
insert into DimEmmplyee3 Values(4,'Mike','Gerasimov',1800,'Male','NewYork')
insert into DimEmmplyee3 Values(5,'Vald','Ivanov',2500,'Male','NewYork')
Select * from DimEmmplyee3

Create Nonclustered index Ix_tblemploylee_salary
on DimEmmplyee3(slary asc)

UPDATE DimEmmplyee3
SET slary = 4999
WHERE id=3; 

Select * from DimEmmplyee3 where slary > 4000 and slary < 8000

UPDATE DimEmmplyee3
SET slary = 7500
WHERE id=3; 

Delete from DimEmmplyee3 where slary =2500
Update DimEmmplyee3 set slary = 9000 where slary = 7500
Select * from DimEmmplyee3

sELECT * FROM DimEmmplyee3 ORDER BY slary

	sELECT * FROM DimEmmplyee3 ORDER BY slary desc

	Select slary, Count(slary) as total 
	from DimEmmplyee3
	Group by slary 
