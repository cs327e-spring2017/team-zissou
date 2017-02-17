-- verify numbers of rows
select count(*) from Movies;
select count(*) from Genres;
select count(*) from Keywords;
select count(*) from Series;
select count(*) from Actors;
select count(*) from Casts;
select count(*) from Characters;

--examine some sample rows
select * from Actors
where first_name='Nicolas' and last_name='Cage';
--nick cage's actor_id = 1705341
select * from Casts
where actor_id=1705341;
