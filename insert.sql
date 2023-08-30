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
