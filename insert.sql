INSERT INTO room_type (description, max_capacity)
VALUES ('cool room',1);
INSERT INTO room_type (description, max_capacity)
VALUES ('cool room',2);
INSERT INTO room_type (description, max_capacity)
VALUES ('cool room',3);
 
select * from room_type

Insert Into  guest (first_name,last_name,member_since)
 Values ('Vlad','Andreev','2022-12-24');
 Insert Into  guest (first_name,last_name,member_since)
 Values ('Artem','Maksimov','2022-12-24');
 Insert Into  guest (first_name,last_name,member_since)
 Values ('Ignat','iiOO','2022-12-24');
 Insert Into  guest (first_name,last_name,member_since)
 Values ('Liza','AHAHAHAh','2022-12-24');
 Insert Into  guest (first_name,last_name,member_since)
 Values ('Dylan','Gdeon','2022-12-24');

 select * from guest

	Insert Into reservation(date_in,date_out,made_by,guestID)
	Values ('2022-12-24','2022-12-26','ID',1);
	Insert Into reservation(date_in,date_out,made_by,guestID)
	Values ('2022-12-24','2022-12-26','ID',2);
	Insert Into reservation(date_in,date_out,made_by,guestID)
	Values ('2022-12-24','2022-12-26','ID',3);
	Insert Into reservation(date_in,date_out,made_by,guestID)
	Values ('2022-12-24','2022-12-26','ID',4);
	Insert Into reservation(date_in,date_out,made_by,guestID)
	Values ('2022-12-24','2022-12-26','ID',5);
 select * from reservation

	Insert Into reserved_room(number_of_rooms,reservationID,room_typeID,)
	Values (1,1,1);
	Insert Into reserved_room(number_of_rooms,reservationID,room_typeID,)
	Values (2,2,2);
	Insert Into reserved_room(number_of_rooms,reservationID,room_typeID,)
	Values (3,3,3);
	Insert Into reserved_room(number_of_rooms,reservationID,room_typeID)
	Values (4,4,2);
	Insert Into reserved_room(number_of_rooms,reservationID,room_typeID)
	Values (5,5,3);
UPDATE reserved_room
SET status = 'booked'; 

 select * from reserved_room

	Insert Into room(number,status,name,smoke,room_typeID)
	Values ('1','booked','1 room',1,2);
	Insert Into room(number,status,name,smoke,room_typeID)
	Values ('2','booked','5 room',0,1)
	Insert Into room(number,status,name,smoke,room_typeID)
	Values ('3','booked','4 room',1,3)
	Insert Into room(number,status,name,smoke,room_typeID)
	Values ('4','booked','3 room',0,1)
	Insert Into room(number,status,name,smoke,room_typeID)
	Values ('5','booked','2 room',1,2)

 select * from  room

	Insert Into occupled_room(check_in, check_out,reservationID,roomID )
	Values ('2024-12-26','2024-12-26',1,5);
	Insert Into occupled_room(check_in, check_out,reservationID,roomID )
	Values ('2024-12-26','2024-12-26',2,4);
	Insert Into occupled_room(check_in, check_out,reservationID,roomID )
	Values ('2024-12-26','2024-12-26',3,3);
	Insert Into occupled_room(check_in, check_out,reservationID,roomID )
	Values ('2024-12-26','2024-12-26',4,2);
	Insert Into occupled_room(check_in, check_out,reservationID,roomID )
	Values ('2024-12-26','2024-12-26',5,1);

 select * from  occupled_room


	Insert Into hosted_at(occupled_roomID, guestID)
	Values (5,3);
	Insert Into hosted_at(occupled_roomID, guestID)
	Values (4,2);
	Insert Into hosted_at(occupled_roomID, guestID)
	Values (3,1);
	Insert Into hosted_at(occupled_roomID, guestID)
	Values (1,4);
	Insert Into hosted_at(occupled_roomID, guestID)
	Values (2,5);

 select * from  hosted_at



