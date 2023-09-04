CREATE TABLE guest(
    guestID int PRIMARY KEY AUTO_INCREMENT,
    first_name varchar(80) ,
	last_name varchar(80) Null ,
    member_since date);
 select * from guest

CREATE TABLE logi(
 Id INT PRIMARY KEY AUTO_INCREMENT,
Kuupaev DATETIME,
Kasutaja VARCHAR(100),
Andmed TEXT,
Tegevus varchar(100))

INSERT INTO logi(Kuupaev,Kasutaja,Andmed,Tegevus)
VALUES(NOW(),USER,NEW.last_name,'guest on lisattud')
