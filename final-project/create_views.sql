set search_path=unified;

--1. How many releases in each language?
--Time: 928.578 ms

create view v_q1 as
	 count(release_id), ml.name, language
	from MB_Releases mr inner join MB_language ml on mr.language = ml.id
	group by language, ml.name
	order by count(release_id);

--2. How many releases does Neil Young have in each year? [FIX]
--Time: 1995.778 ms

create view v_q2 as
	 distinct rj.title from Artist_Join aj
	inner join D_Artists da on aj.discog_id = da.artist_id
	inner join D_Release_Artists dra on dra.artist_id = da.artist_id
	inner join D_Releases dr on dr.release_id = dra.release_id
	inner join Release_Join rj on rj.discog_id = dr.release_id
	inner join MB_Releases mr on rj.mb_id = mr.release_id
	inner join MB_Artist_credit mac on mr.artist_credit = mac.id
	where aj.name='Neil Young' or mac.name='Neil Young';

--3. Which labels have the Beastie Boys released under? [FIX]
--Time: 1895.775 ms

create view v_q3 as
	 distinct lj.name from Artist_Join aj
	inner join D_Artists da on aj.discog_id = da.artist_id
	inner join D_Release_Artists dra on dra.artist_id = da.artist_id
	inner join D_Releases dr on dr.release_id = dra.release_id
	inner join D_Releases_Labels drl on drl.release_id = dr.release_id
	inner join D_Labels dl on dl.label_id = drl.label_id
	inner join Label_Join lj on lj.disc_id = dl.label_id
	where aj.name='Red Hot Chili Peppers';

--4. How many releases does each label have?
--Time: 2697.960 ms

create view v_q4 as
	 lj.name, count(*) from Release_Join rj
	inner join D_Releases dr on dr.release_id = rj.discog_id
	inner join D_Releases_Labels drl on drl.release_id = dr.release_id
	inner join D_Labels dl on dl.label_id = drl.label_id
	inner join Label_Join lj on lj.disc_id = dl.label_id
	group by lj.name
	order by count(*);

--5. What formats has Let It Be been released under? [FIX]
--Time: 1334.840 ms

create view v_q5 as
	 distinct mmf.name from MB_Medium_format mmf
	inner join MB_Medium mm on mmf.id = mm.format
	inner join MB_Releases mr on mm.release = mr.release_id
	where mr.title='Let It Be';

--6. How many releases under the label Epic Records?

create view v_q6 as
	 count(*)
	from MB_Label l left join MB_Release_Label r on l.id = r.label
	where l.name = 'Epic';

--7. What genres has Radiohead released under?

create view v_q7 as
	 distinct dg.name from D_Genre dg
	inner join D_Releases_Genre rg on dg.genre_id = rg.genre_id
	inner join D_Release_Artists ra on rg.release_id = ra.release_id
	inner join D_Artists a on ra.artist_id = a.artist_id
	where a.name = 'Radiohead';

--8. How many artist credits has Future received?

create view v_q8 as
	 count(*)
	from MB_Track t left join MB_Artists_credit_name a on t.artist_credit = a.artist_credit
	where a.name = 'Future';

--9. How many release groups is Kanye West associated with?

create view v_q9 as
	 count(*)
	from MB_Artists_credit_name a left join MB_Release_Group r on a.artist_credit = r.artist_credit
	where a.name = 'Kanye West';

--10. What artists have done a rendition of Bohemian Rhapsody?

create view v_q10 as
	 distinct acn.name from MB_Artists_credit_name acn
	left join MB_Track t on acn.artist_credit = t.artist_credit
	where t.name = 'Bohemian Rhapsody'
	order by acn.name;
