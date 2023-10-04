 CREATE TABLE AuditTable
(
    AuditRecordID INT IDENTITY(1, 1) ,
    EventType VARCHAR(128) ,
    PostTime VARCHAR(128) ,
    SPID INT ,
    UserName VARCHAR(128) ,
    DatabaseName VARCHAR(128) ,
    SchemaName VARCHAR(128) ,
    ObjectName VARCHAR(128) ,
    ObjectType VARCHAR(128) ,
    Parameters VARCHAR(2000) ,
    AlterTableActionList VARCHAR(2000) ,
    TSQLCommand VARCHAR(2000)
);

CREATE OR ALTER TRIGGER TR_Schema_Change ON DATABASE 
FOR DDL_TABLE_VIEW_EVENTS
AS
 
DECLARE @EventData XML;  
SET @EventData = EVENTDATA();  
 
INSERT INTO dbo.AuditTable ( EventType ,
                             PostTime ,
                             SPID ,
                             UserName ,
                             DatabaseName ,
                             SchemaName ,
                             ObjectName ,
                             ObjectType ,
                             Parameters ,
                             AlterTableActionList ,
                             TSQLCommand )
 VALUES (@EventData.value('(/EVENT_INSTANCE/EventType)[1]', 'VARCHAR(128)') ,
         @EventData.value('(/EVENT_INSTANCE/PostTime)[1]', 'VARCHAR(128)')  ,
         @EventData.value('(/EVENT_INSTANCE/SPID)[1]', 'VARCHAR(128)')  ,
         @EventData.value('(/EVENT_INSTANCE/UserName)[1]', 'VARCHAR(128)')  ,
         @EventData.value('(/EVENT_INSTANCE/DatabaseName)[1]', 'VARCHAR(128)')  ,
         @EventData.value('(/EVENT_INSTANCE/SchemaName)[1]', 'VARCHAR(128)') ,
         @EventData.value('(/EVENT_INSTANCE/ObjectName)[1]', 'VARCHAR(128)') ,
         @EventData.value('(/EVENT_INSTANCE/ObjectType)[1]', 'VARCHAR(128)') ,
         @EventData.value('(/EVENT_INSTANCE/Parameters)[1]', 'VARCHAR(128)')  ,
         @EventData.value('(/EVENT_INSTANCE/AlterTableActionList)[1]', 'VARCHAR(128)')  ,
         @EventData.value('(/EVENT_INSTANCE/TSQLCommand)[1]', 'nvarchar(2000)') 
      );
 
GO


CREATE TABLE t1(a INT)

ALTER TABLE t1 ADD b INT 

DROP TABLE t1
 
SELECT * FROM dbo.AuditTable

SELECT QUOTENAME(OBJECT_SCHEMA_NAME(TR.object_id)) + '.' + QUOTENAME(TR.name) [Trigger_name],
       QUOTENAME(OBJECT_SCHEMA_NAME(T.object_id)) + '.' + QUOTENAME(T.name) [Parent_table_name],                 
       QUOTENAME(OBJECT_SCHEMA_NAME(V.object_id)) + '.' + QUOTENAME(V.name) [Parent_view_name]
FROM sys.triggers TR
LEFT JOIN sys.tables T
    ON TR.parent_id = T.object_id
LEFT JOIN sys.views V
    ON TR.parent_id = V.object_id
WHERE TR.parent_class = 1


SELECT name,
       parent_class_desc,
       type_desc,
       is_disabled
FROM sys.triggers
WHERE is_disabled = 0;
