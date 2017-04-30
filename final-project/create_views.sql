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

--5. What is the most-covered song? (release name with the most artists)
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

--8. Number of  Tracks in Albums that Future released.
--Time: 17450.152 ms

create view v_q8 as
	 r.title as Album, count(t.name) as Songs from MB_Track t
	right join MB_Medium m on t.medium = m.id
	right join MB_Releases r on m.release = r.release_id
	right join MB_Artists_credit_name acn on r.artist_credit = acn.artist_credit
	where acn.name = 'Future'
	group by r.title;

--9. Number of Releases per Label that Kanye West has worker for
--Time: 6240.194 ms

create view v_q9 as
	 l.name as Label, count(r.title) as album from MB_Label l
	right join MB_Release_Label rl on l.id = rl.label
	right join MB_Releases r on rl.release = r.release_id
	right join MB_Artists_credit_name acn on r.artist_credit = acn.artist_credit
	where acn.name = 'Kanye West'
	group by l.name;

--10. What genre produces the most renditions of Bohemian Rhapsody?
--Time: 9586.792 ms

create view v_q10 as
	select  dg.name as Genre, count(acn.name) as Artists from MB_Artists_credit_name acn 
	right join MB_Track t on acn.artist_credit = t.artist_credit
	right join MB_Releases r on t.artist_credit = r.artist_credit
	right join Release_Join rj on r.title = rj.title
	right join D_Releases dr on rj.discog_id = dr.release_id
	right join D_Releases_Genre rg on dr.release_id = rg.release_id
	right join D_Genre dg on rg.genre_id = dg.genre_id
	where t.name = 'Bohemian Rhapsody'
	group by dg.name;