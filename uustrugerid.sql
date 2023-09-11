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

CREATE TRIGGER linnalisamine
ON linn
FOR INSERT
AS 
BEGIN
    INSERT INTO logi (kuupaev, andmed, kasutaja)
    SELECT GETDATE(),
           CONCAT(inserted.linn, ', ', m.maakond),
           USER
    FROM inserted
    INNER JOIN maakond m ON inserted.maakondid = m.maakondid
END;

insert into linn(linn,maakondid)
values ('Tallinn',1)
select * from linn;
select * from logi;

CREATE TRIGGER linnauuendamine
ON linn
AFTER UPDATE
AS 
BEGIN
    INSERT INTO logi (kuupaev, andmed, kasutaja)
    SELECT GETDATE(),
           CONCAT('Vanad andmed: ',deleted.linn,', ',m1.maakond,' Uued andmed: ',inserted.linn, ', ', m2.maakond),
           USER
    FROM deleted
    INNER JOIN maakond m1 ON deleted.maakondid = m1.maakondid
	INNER JOIN inserted ON deleted.linnid = inserted.linnid
    INNER JOIN maakond m2 ON inserted.maakondid = m2.maakondid
END;

UPDATE linn
SET linn= 'Maardu'
WHERE linnid = 1; 
select * from linn;
select * from logi;

insert into maakond(maakond)
values('Harjumaa');
insert into maakond(maakond)
values('Parnumaa');
insert into maakond(maakond)
values('Tartumaa');
insert into maakond(maakond)
values('Ida-Virumaa')
insert into maakond(maakond)
values('Võrumaa')
Select * from maakond;

insert into linn(linn,maakondid)
values ('Tallinn',1)
insert into linn(linn,maakondid)
values ('Pärnu',2)
insert into linn(linn,maakondid)
values ('Tartu',3)
insert into linn(linn,maakondid)
values ('Narva',4)
insert into linn(linn,maakondid)
values ('Võru',5)
select * from linn;
select * from logi;




XAMPPPPP


INSERT INTO logi (kuupaev, andmed, kasutaja)
SELECT NOW(),
       CONCAT(new.linn, ', ', m.maakond),
       USER()
FROM linn l
INNER JOIN maakond m
ON l.maakondid = m.maakondid
WHERE l.linnid = new.linnid



INSERT INTO logi (kuupaev, andmed, kasutaja)
    SELECT now(),
           CONCAT('Vanad andmed: ',old.linn,', ',m1.maakond,'\n Uued andmed: ',new.linn, ', ', m2.maakond),
           USER()
    FROM linn l
    INNER JOIN maakond m1 ON old.maakondid = m1.maakondid
    INNER JOIN maakond m2 ON new.maakondid = m2.maakondid
    where l.linnid = new.linnid
