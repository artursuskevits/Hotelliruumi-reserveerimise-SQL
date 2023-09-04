------Protseduuurid
------Admede lisamine ja select
CREATE PROCEDURE InsertGuest
    @first_name varchar(80),
    @last_name varchar(80),
    @member_since date
AS
BEGIN
    INSERT INTO guest (first_name, last_name, member_since)
    VALUES (@first_name, @last_name, @member_since);
	select * from guest;
END;
EXEC InsertGuest 'Vlad', 'Vladuha', '2023-02-15';
------Kusttutamine
create procedure GuestKustamine
@kustutaID int
as
begin
Select * from guest;
Delete from guest
where guestID=@kustutaID;
Select * from guest;
end
 
Exec GuestKustamine 4 ;
------Andmete uuendamine sissetatud id järgi
create procedure Update_Guest
@updateID int,
@uusname varchar(30)
as
begin
update guest set first_name = @uusname
where guestId=@updateID;
Select * from guest;
end
 
Exec Update_Guest @updateID=3, @uusname='Valentin' ;
------Kasutajate arvu leidmine
go
create procedure Count_guests
as
begin
Select count(first_name) as kuiplaju
from guest;
end;
 
Exec Count_guests ;
------Create my
ne dodelal
create procedure Showallguestwhohavecharinname
@char varchar (1),
as
begin

if first_name = %@char%
Set @sqltegevus = CONCat ('Alter Table ', @tabelnimi, ' ADD ', @veerunimi, ' ',@tyyp);
execute (@sqltegevus)
if @valik='kustuta'
set @tyyp = 0;
Set @sqltegevus = CONCat ('Alter Table ', @tabelnimi, ' Drop Column ', @veerunimi);
execute (@sqltegevus)
end;

