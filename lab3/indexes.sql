--for queries 1, 3, and 10
create index year_idx on Movies (year);

--for queries 2 and 4
create index actor_name_idx ON Actors (last_name, first_name);

--for query 6
create index title_idx on Series (name);
