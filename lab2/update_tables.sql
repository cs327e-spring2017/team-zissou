update Actors
set gender = 'M' where gender = '1';

update Actors
set gender = 'F' where gender is null;

update Movies
set type = 'V' where type = '1';

update Movies
set type = 'VG' where type = '2';

update Movies
set type = 'FF' where type = '3';

update Movies
set type = 'TVM' where type is null;

update Movies
set type = 'TVS' where movie_id in (select movie_id from Series);
