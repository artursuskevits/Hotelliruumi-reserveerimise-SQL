
---92. DDL Trigger SQL serveris

CREATE TRIGGER tymyfirsttrigger
ON DATABASE
FOR CREATE_TABLE
AS
BEGIN
    PRINT 'A new table has been created in the database.';
END;

Create table TEst (id int);


Alter table tymyfirsttrigger
on database
for Create_table, Alter_Table,Drop_Table
as 
begin
rollback
print 'You cannot create, alter or drop table'
end

Alter TRIGGER tymyfirsttrigger
ON DATABASE
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS
BEGIN
    ROLLBACK;
    PRINT 'You cannot create, alter, or drop tables in this database.';
END;

drop table TEst;

Create trigger trRenameTable
on database
for RENAME
AS
BEGIN
print 'YOU RENAME SOMETHING'
END

drop trigger tymyfirsttrigger on database
Exec sp_rename'TEst', 'Test2'
ALTER TABLE TEst
RENAME TO Test2;

---93. Server-Scoped DDL triggerid

Create TRIGGER tymyfirsttrigger
ON DATABASE
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS
BEGIN
    ROLLBACK;
    PRINT 'You cannot create, alter, or drop tables in this database.';
END;


drop table Test2;

Create TRIGGER tymyfirsttrigger
ON All server 
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS
BEGIN
    ROLLBACK;
    PRINT 'You cannot create, alter, or drop tables on the server';
END;

Disable trigger tymyfirsttrigger on all server
drop table Test2;

enable trigger tymyfirsttrigger on all server 
drop table Test2;

drop trigger tymyfirsttrigger on all server

drop trigger tymyfirsttrigger on database

enable trigger tymyfirsttrigger on all server 
drop table Test2;

---94. SQL serveri trigeri täitmise järjekord

Create TRIGGER TAblecreationDatabase
ON Database
FOR CREATE_TABLE
AS
BEGIN
    
    PRINT 'YDatabsae scope trigger ';
END;


Create TRIGGER TAblecreationServer
ON All server 
FOR CREATE_TABLE
AS
BEGIN
    
    PRINT 'Server Scope Trigger';
END;

Create table TEst3 (id int);

---96. Logon trigger SQL serveris
Create trigger tr_LogonAuditTriggers
on all server
for LOGON
As
Begin
Declare @LoginName varchar(100)
Set @LoginName = ORiGINAL_LOGIN()
if (Select Count (*) from sys.dm_exec_sessions
where is_user_process=1
AND original_login_name = @LoginName) > 3
Begin
print 'Fourth connection of' + @LoginName + 'blocked'
Rollback
end
end
Execute sp_readerrorlog


drop trigger tr_LogonAuditTriggers on all server
Execute sp_readerrorlog
