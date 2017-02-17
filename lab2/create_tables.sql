drop database if exists imdb;
create database imdb;
\c imdb;

create table Movies(
	movie_id int primary key,
	title text,
	year int,
	num int,
	type int,
	location text,
	language text);

create table Genres(
	genre_id int primary key,
	genre text);

create table Keywords(
	keyword_id int primary key,
	keyword text);

create table Series(
	series_id int primary key,
	movie_id int not null references Movies(movie_id),
	name text,
	season int,
	episode_num int);

create table Actors(
	actor_id int primary key,
	last_name text,
	first_name text,
	mid_name text,
	gender int,
	which_one int);

create table Casts(
	cast_id int primary key,
	movie_id int references Movies(movie_id),
	series_id int references Series(series_id),
	actor_id int references Actors(actor_id),
	character text,
	position int);

create table Characters(
	char_id int primary key,
	actor_id int not null references Actors(actor_id),
	char_name text);
