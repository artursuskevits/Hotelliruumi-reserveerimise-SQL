--SQL
--Delaju na osnove room_type i room
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

Insert Into room(number,status,name,smoke,room_typeID)
	Values ('1','booked','first room',1,2);
	select * from  room;
	select* from logi;
-- Trigger muudetud kirjete jälgimiseks linnad tabeli:




--XAMPP
