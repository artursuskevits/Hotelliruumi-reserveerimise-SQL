create trigger guestKustutamine
On guest
For delete
As
INSERT INTO logi(Kuupaev,Kasutaja,Andmed,Tegevus)
Select GETDATE(), USER, 
Concat(deleted.first_name,', ', deleted.last_name), 'guest on kustatyd'
from deleted
