--1
select count(movie_id)
from Movies
where year=2016;

--2
select count(actor_id)
from Actors
where last_name='Smith';

--3
select cast(count(series_id) as float)/cast(count(*) as float) as prop_show
from Movies m full join Series s on m.movie_id = s.series_id
where year=2016;

--4
select count(distinct movie_id)
from Casts c inner join Actors a on c.actor_id = a.actor_id
where first_name='Nicolas' and last_name='Cage';

--5
select avg(num_chars)
from (select m.movie_id, count(char_id) as num_chars
	  from Characters a inner join Casts b on a.actor_id = b.actor_id
	  inner join Movies m on b.movie_id = m.movie_id
	  group by m.movie_id, series_id
	  having year=2016 and series_id is null) as temp;

--6
select avg(num_episodes)
from (select s.movie_id, season, title, count(series_id) as num_episodes
	  from Series s left join Movies m on s.movie_id = m.movie_id
	  group by s.movie_id, season, title
	  having title='The Simpsons') as temp;

--7
select count(episode_num) as epi_num_occurance from Series
group by episode_num
order by epi_num_occurance desc
limit 1;

--8
select last_name from Actors
group by last_name
order by count(*)
limit 1;

--9
select Actors.actor_id, Actors.last_name, Actors.first_name from Actors 
inner join Casts on Actors.actor_id = Casts.actor_id
group by Actors.actor_id
order by count(*) desc
limit 1;


--10
select c.cast_id, c.movie_id from Casts c
inner join Movies m on c.movie_id = m.movie_id
group by c.cast_id
order by count(*) desc
limit 1;