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
