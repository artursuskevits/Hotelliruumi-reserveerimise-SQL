CREATE TABLE room_type(
    room_typeID int PRIMARY KEY identity(1,1),
    description varchar(80),
    max_capacity int);
select * from room_type

CREATE TABLE guest(
    guestID int PRIMARY KEY identity(1,1),
    first_name varchar(80) ,
	last_name varchar(80) Null ,
    member_since date);
 select * from guest

 CREATE TABLE reservation(
    reservationID int PRIMARY KEY identity(1,1),
	date_in date,
	date_out date,
    made_by varchar(20) UNIQUE,
    guestID int  FOREIGN KEY REFERENCES guest(guestID));
 select * from reservation

 CREATE TABLE reserved_room(
    reserved_roomID int PRIMARY KEY identity(1,1),
    status varchar(20) ,
	number_of_rooms int,
    reservationID int  FOREIGN KEY REFERENCES reservation(reservationID),
	room_typeID int Foreign Key References room_type(room_typeID));

 select * from reserved_room

CREATE TABLE room(
    roomID int PRIMARY KEY identity(1,1),
    number varchar(10) ,
	status varchar(10) ,
	name varchar(40) ,
	smoke BIT,
	room_typeID int Foreign Key References room_type(room_typeID));

 select * from  room

 CREATE TABLE occupled_room(
    occupled_roomID int PRIMARY KEY identity(1,1),
    check_in timestamp ,
	check_out datetime ,
	reservationID int  FOREIGN KEY REFERENCES reservation(reservationID),
	roomID int FOREIGN KEY REFERENCES room(roomID));

 select * from  occupled_room
