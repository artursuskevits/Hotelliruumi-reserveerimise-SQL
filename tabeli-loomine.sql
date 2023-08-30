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
