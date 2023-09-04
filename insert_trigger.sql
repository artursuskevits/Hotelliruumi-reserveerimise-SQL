CREATE TABLE guest(
    guestID int PRIMARY KEY identity(1,1),
    first_name varchar(80) ,
	last_name varchar(80) Null ,
    member_since date);
 select * from guest

CREATE TABLE logi(
 Id INT PRIMARY KEY identity(1,1)T,
Kuupaev DATETIME,
Kasutaja VARCHAR(100),
Andmed TEXT,
Tegevus varchar(100))

INSERT INTO logi(Kuupaev,Kasutaja,Andmed,Tegevus)
VALUES(NOW(),USER,NEW.last_name,'guest on lisattud')

create trigger guestLisamine
On guest
For INsert
As
INSERT INTO logi(Kuupaev,Kasutaja,Andmed,Tegevus)
Select GETDATE(), USER, 
Concat(inserted.first_name,', ', inserted.last_name), 'guest on lisatud'
from inserted

Insert Into  guest (first_name,last_name,member_since)
 Values ('Vlad','Andreev','2022-12-24');
 Insert Into  guest (first_name,last_name,member_since)
 Values ('Artemmmmmmmm','Maksimmmmmmmmmov','2022-12-24');
 select * from guest;
 select * from logi;

