set search_path=unified;

--1. How many releases in each language?
--Time: 928.578 ms

create view v_q1 as
	 count(release_id), ml.name, language
	from MB_Releases mr inner join MB_language ml on mr.language = ml.id
	group by language, ml.name
	order by count(release_id);

--2. How many releases does Neil Young have in each format?
--Time: 994.008 ms

create view v_q2 as
	 mmf.name, count(mr.release_id) from MB_Medium_format mmf
	inner join MB_Medium mm on mmf.id = mm.format
	inner join MB_Releases mr on mm.release = mr.release_id
	inner join Release_Join rj on rj.mb_id = mr.release_id
	inner join D_Releases dr on rj.discog_id = dr.release_id
	inner join D_Release_Artists dra on dr.release_id = dra.release_id
	inner join D_Artists da on dra.artist_id = da.artist_id
	inner join Artist_Join aj on aj.discog_id = da.artist_id
	where aj.name='Neil Young'
	group by mmf.name
	order by count(mr.release_id);

--3. How many artists from each country?
--Time: 1581.991 ms

create view v_q3 as
	 country, count(da.artist_id) from Artist_Join aj
	inner join D_Artists da on aj.discog_id = da.artist_id
	inner join D_Release_Artists dra on dra.artist_id = da.artist_id
	inner join D_Releases dr on dr.release_id = dra.release_id
	inner join Release_Join rj on rj.discog_id = dr.release_id
	group by country
	order by count(da.artist_id);

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

--5. What is the most-covered song? (release name with the most artists) [FIX]
--Time: 2497.061 ms

create view v_q5 as
	 dr.title, count(da.artist_id) from Artist_Join aj
	inner join D_Artists da on aj.discog_id = da.artist_id
	inner join D_Release_Artists dra on dra.artist_id = da.artist_id
	inner join D_Releases dr on dr.release_id = dra.release_id
	inner join Release_Join rj on rj.discog_id = dr.release_id
	group by dr.title
	order by count(da.artist_id);

--6. What has been released under the label 'Epic'?
--Time: 1538.901 ms

create view v_q6 as
	 aj.name, mr.title
	from MB_Label l left join MB_Release_Label r on l.id = r.label
	inner join MB_Releases mr on mr.release_id = r.release
	inner join Release_Join rj on rj.mb_id = mr.release_id
	inner join D_Releases dr on rj.discog_id = dr.release_id
	inner join D_Release_Artists dra on dr.release_id = dra.release_id
	inner join D_Artists da on dra.artist_id = da.artist_id
	inner join Artist_Join aj on aj.discog_id = da.artist_id
	where l.name = 'Epic' order by aj.name;

--7. Which artists have released under the most genres?
--Time: 2110.716 ms

create view v_q7 as
	 a.name, count(distinct dg.name) from D_Genre dg
	inner join D_Releases_Genre rg on dg.genre_id = rg.genre_id
	inner join D_Release_Artists ra on rg.release_id = ra.release_id
	inner join D_Artists a on ra.artist_id = a.artist_id
	group by a.name
	order by count(distinct dg.name);

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
