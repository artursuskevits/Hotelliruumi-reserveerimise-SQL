create trigger guestuuendamine
On guest
For update
As
INSERT INTO logi(Kuupaev,Kasutaja,Andmed,Tegevus)
Select GETDATE(), USER, 
Concat('vanad - ', deleted.first_name,', ', deleted.last_name, 'uued - '
, inserted.first_name,', ', inserted.last_name), 'guest on uuendatud'
from deleted inner join inserted
on deleted.guestId =inserted.guestId
