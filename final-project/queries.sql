--1. How many releases in each language?

select count(id), language
from MB_Releases
group by language;

--2. How many releases do The Beatles have?

select count(*)
from MB_Releases mb inner join Release_Join j on mb.id = j.mb_id
inner join D_Releases d on d.release_id = j.discog_id
where j.name='The Beatles';

--3. Which labels has a particular artist released under?



--4. How many releases does each label have?



--5. What formats has a particular artist released under?



--6. How many releases under each label type?



--7. What release groups are associated with a particular release (or vice versa)?



--8. What artist credits has a particular artist received?



--9. What artist credits are associated with a particular release / release group?



--10. What is the longest (or shortest) track for a particular artist?



--11. What are the known aliases for particular artist / release?


