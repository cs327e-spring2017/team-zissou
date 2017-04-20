set search_path=unified;

--1. How many releases in each language?

select count(release_id), language
from MB_Releases
group by language;

--2. What releases does Neil Young have?

select distinct rj.title from Artist_Join aj
inner join D_Artists da on aj.discog_id = da.artist_id
inner join D_Release_Artists dra on dra.artist_id = da.artist_id
inner join D_Releases dr on dr.release_id = dra.release_id
inner join Release_Join rj on rj.discog_id = dr.release_id
inner join MB_Releases mr on rj.mb_id = mr.release_id
inner join MB_Artist_credit mac on mr.artist_credit = mac.id
where aj.name='Neil Young' or mac.name='Neil Young';

--3. Which labels have RHCP released under?

select distinct lj.name from Artist_Join aj
inner join D_Artists da on aj.discog_id = da.artist_id
inner join D_Release_Artists dra on dra.artist_id = da.artist_id
inner join D_Releases dr on dr.release_id = dra.release_id
inner join D_Releases_Labels drl on drl.release_id = dr.release_id
inner join D_Labels dl on dl.label_id = drl.label_id
inner join Label_Join lj on lj.disc_id = dl.label_id
where aj.name='Red Hot Chili Peppers';

--4. How many releases does each label have?

select lj.name, count(*) from Release_Join rj
inner join D_Releases dr on dr.release_id = rj.release_id
inner join D_Releases_Labels drl on drl.release_id = dr.release_id
inner join D_Labels dl on dl.label_id = drl.label_id
inner join Label_Join lj on lj.disc_id = dl.label_id
group by lj.name;

--5. What formats has Neil Young released under?

select distinct mmf.name from MB_Medium_format mmf
inner join MB_Medium mm on mmf.id = mm.format
inner join MB_Releases mr on mm.release = mr.id
inner join MB_Artist_credit mac on mac.id = mr.artist_credit
where mac.name='Neil Young';

--6. How many releases under the label Epic Records?
select count(*)
from MB_Label l left join MB_Release_Label r on l.id = r.label
where l.name = 'Epic';

--7. What genres has Radiohead released under?
select distinct dg.name from D_Genre dg
inner join D_Releases_Genre rg on dg.genre_id = rg.genre_id
inner join D_Release_Artists ra on rg.release_id = ra.release_id
inner join D_Artists a on ra.artist_id = a.artist_id
where a.name = 'Radiohead';

--8. What Tracks and Albums has Future released?
select t.name as Track, r.title as Album from MB_Track t
right join MB_Medium m on t.medium = m.id
right join MB_Releases r on m.release = r.release_id
right join MB_Artists_credit_name acn on r.artist_credit = acn.artist_credit
where acn.name = 'Future'
order by r.title;

--9. How are the labels and albums that Kanye West has worked for?
select l.name as Label, r.title as album from MB_Label l
right join MB_Release_Label rl on l.id = rl.label
right join MB_Releases r on rl.release = r.release_id
right join MB_Artists_credit_name acn on r.artist_credit = acn.artist_credit
where acn.name = 'Kanye West'
order by l.name;

--10. What artists have done a rendition of Bohemian Rhapsody and what is there genre?
select distinct acn.name as Artist, dg.name from MB_Artists_credit_name acn 
right join MB_Track t on acn.artist_credit = t.artist_credit
right join MB_Releases r on t.artist_credit = r.artist_credit
right join Release_Join rj on r.title = rj.title
right join D_Releases dr on rj.discog_id = dr.release_id
right join D_Releases_Genre rg on dr.release_id = rg.release_id
right join D_Genre dg on rg.genre_id = dg.genre_id
where t.name = 'Bohemian Rhapsody'
order by acn.name;


