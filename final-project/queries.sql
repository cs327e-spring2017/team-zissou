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

--8. How many artist credits has Future received?
select count(*)
from MB_Track t left join MB_Artists_credit_name a on t.artist_credit = a.artist_credit
where a.name = 'Future';

--9. How many release groups is Kanye West associated with?
select count(*)
from MB_Artists_credit_name a left join MB_Release_Group r on a.artist_credit = r.artist_credit
where a.name = 'Kanye West';

--10. What artists have done a rendition of Bohemian Rhapsody?
select distinct acn.name from MB_Artists_credit_name acn
left join MB_Track t on acn.artist_credit = t.artist_credit
where t.name = 'Bohemian Rhapsody'
order by acn.name;
