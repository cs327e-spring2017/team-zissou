--1. How many releases in each language?

select count(id), language
from MB_Releases
group by language;

--2. How many releases do The Beatles have?

select count(*) from Artist_Join aj
inner join D_Artists da on aj.disc_id = da.artist_id
inner join D_Release_Artists 
inner join D_Releases dr
inner join Release_Join rj on rj.discog_id = dr.release_id
inner join MB_Release mr on rj.mb_id = mr.id
inner join MB_Artist_credit mac on mr.artist_credit = mac.id
where aj.name='The Beatles' or mac.name='The Beatles';

--3. Which labels has a particular artist released under?



--4. How many releases does each label have?



--5. What formats has a particular artist released under?



--6. How many releases under each label type?



--7. What release groups are associated with a particular release (or vice versa)?



--8. What artist credits has a particular artist received?



--9. What artist credits are associated with a particular release / release group?



--10. What is the longest (or shortest) track for a particular artist?



--11. What are the known aliases for particular artist / release?


