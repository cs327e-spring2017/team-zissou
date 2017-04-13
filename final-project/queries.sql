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

--6. How many releases under the label Epic Records?
select count(*)
from Discog_Labels l left join Discog_Release_Labels r on l.label_id = r.label_id
where l.name = 'Epic Records';

--7. What genres has Radiohead released under?
select distinct dg.name from Discog_Genre dg
inner join Discog_Releases_Genre rg on dg.genre_id = rg.genre_id
inner join Discog_Release_Artists ra on rg.release_id = ra.release_id
inner join Discog_Artists a on ra.artist_id = a.artist_id
where a.name = 'Radiohead';

--8. How many artist credits has Future received?
select count(*)
from MB_Track t left join MB_Artist_credit_name a on t.artist_credit = a.artist_credit
where a.name = 'Future';

--9. How many release groups is Kanye West associated with?
select count(*)
from MB_Artist_credit_name a left join MB_Release_Group r on a.artist_credit = r.artist_credit
where a.name = 'Kanye West';

--10. What artists have done a rendition of Bohemian Rhapsody?
select distinct acn.name from MB_Artist_credit_name acn
left join MB_Track t on acn.artist_credit = t.artist_credit
where t.name = 'Bohemian Rhapsody';
