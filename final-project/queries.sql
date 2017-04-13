--1. How many releases in each language?

select count(id), language
from MB_Releases
group by language;

--2. How many releases do The Beatles have?

select count(distinct rj.name) from Artist_Join aj
inner join D_Artists da on aj.disc_id = da.artist_id
inner join D_Release_Artists 
inner join D_Releases dr
inner join Release_Join rj on rj.discog_id = dr.release_id
inner join MB_Release mr on rj.mb_id = mr.id
inner join MB_Artist_credit mac on mr.artist_credit = mac.id
where aj.name='The Beatles' or mac.name='The Beatles';

--3. Which labels have the Beastie Boys released under?

select distinct lj.name from Artist_Join aj
inner join D_Artists da on aj.disc_id = da.artist_id
inner join D_Release_Artists 
inner join D_Releases 
inner join D_Releases_Labels
inner join D_Labels dl
inner join Label_Join lj on lj.disc_id = dl.label_id
where aj.name='Beastie Boys';

--4. How many releases does each label have?

select lj.name, count(*) from Release_Join rj
inner join D_Releases
inner join D_Releases_Labels
inner join D_Labels dl
inner join Label_Join lj on lj.disc_id = dl.label_id
group by lj.name;

--5. What formats has Neil Young released under?

select distinct mmf.name from MB_Medium_format mmf
inner join MB_Medium mm on mmf.id = mm.format
inner join MB_Release mr on mm.release = mr.id
inner join MB_Artist_credit mac on mac.id = mr.artist_credit
where mac.name='Neil Young';

--6. How many releases under each label type?



--7. What release groups are associated with a particular release (or vice versa)?



--8. What artist credits has a particular artist received?



--9. What artist credits are associated with a particular release / release group?



--10. What is the longest (or shortest) track for a particular artist?



--11. What are the known aliases for particular artist / release?


