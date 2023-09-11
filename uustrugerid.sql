Create table maakond(
maakondid int primary key identity(1,1),
maakond varchar(100)

);

Create table linn(
linnid int primary key identity(1,1),
linn varchar(100),
maakondid int,
foreign key (maakondid) references maakond(maakondid)
);


create table logi(
id int primary key identity(1,1),
andmed text,
kuupaev datetime,
kasutaja varchar(100)
);

insert into maakond(maakond)
values('Harjumaa');
insert into maakond(maakond)
values('Parnumaa');
insert into maakond(maakond)
values('Tartumaa');
Select * from maakond;
