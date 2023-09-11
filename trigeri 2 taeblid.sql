--SQL
--Delaju na osnove room_type i room
--Tabelite loomine
CREATE TABLE room_type(
    room_typeID int PRIMARY KEY identity(1,1),
    description varchar(80),
    max_capacity int);
select * from room_type

CREATE TABLE room(
    roomID int PRIMARY KEY identity(1,1),
    number varchar(10) ,
	status varchar(10) ,
	name varchar(40) ,
	smoke BIT,
	room_typeID int Foreign Key References room_type(room_typeID));

room_type täitmine
INSERT INTO room_type (description, max_capacity)
VALUES ('lux',1);
INSERT INTO room_type (description, max_capacity)
VALUES ('default',2);
INSERT INTO room_type (description, max_capacity)
VALUES ('cheap',3);

--rigger tabelisse lisatud kirjete jälgimiseks:
CREATE TRIGGER roomlisamine
ON room
FOR INSERT
AS 
BEGIN
    INSERT INTO logi (kuupaev, andmed, kasutaja)
    SELECT GETDATE(),
           CONCAT(inserted.number,', ',inserted.status,', ',inserted.name,', ',rt.description),
           USER
    FROM inserted
    inner join room_type rt on inserted.room_typeID =rt.room_typeID
END;
--Kontroll
Insert Into room(number,status,name,smoke,room_typeID)
	Values ('1','booked','first room',1,2);
	select * from  room;
	select* from logi;
-- Trigger muudetud kirjete jälgimiseks linnad tabeli:
	CREATE TRIGGER roomuuendamine
ON room
AFTER UPDATE
AS 
BEGIN
    INSERT INTO logi (kuupaev, andmed, kasutaja)
    SELECT GETDATE(),
           CONCAT('Vanad andmed: ',deleted.number,', ',deleted.status,', ',deleted.name,', ',rt1.description,
		   ' Uued andmed: ',inserted.number,', ',inserted.status,', ',inserted.name,', ',rt2.description),
           USER
    FROM deleted
    INNER JOIN room_type rt1 ON deleted.room_typeID = rt1.room_typeID
	INNER JOIN inserted ON deleted.room_typeID = inserted.room_typeID
    INNER JOIN room_type rt2 ON inserted.room_typeID = rt2.room_typeID
END;
--Kontroll
update room
set number='2',status='unreserved'
where roomID =1;
select * from  room;
	select* from logi;



--XAMPP
--Tabelite loomine
CREATE TABLE room_type(
    room_typeID int PRIMARY KEY AUTO_INCREMENT,
    description varchar(80),
    max_capacity int);
select * from room_type
