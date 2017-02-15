drop database if exists imdb;
create database imdb;
\c imdb;

create table Movies(
	movie_id int primary key,
	title varchar(50),
	year int,
	num int,
	location varchar(5),
	language varchar(20));

create table Genres(
	genre_id int primary key,
	genre varchar(20));

create table Keywords(
	keyword_id int primary key,
	keyword varchar(20));

create table Series(
	series_id int primary key,
	movie_id int not null references Movies(movie_id),
	name varchar(50),
	season int,
	episode_num int);

create table Actors(
	actor_id int primary key,
	last_name varchar(20),
	first_name varchar(20),
	mid_name varchar(20),
	gender varchar(1),
	which_one int);

create table Cast(
	cast_id int primary key,
	movie_id int not null references Movies(movie_id),
	actor_id int not null references Actors(actor_id),
	series_id int not null references Series(series_id));

create table Characters(
	char_id int primary key,
	actor_id int not null references Actors(actor_id),
	char_name varchar(20));