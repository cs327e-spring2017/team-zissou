drop schema if exists discog;

create schema discog;

create table discog.Artists(
   tist_id integer,
   name text,
   realname text
);

create table discog.Genres(
   genre_id integer,
   name text
);

create table discog.Labels(
   label_id integer,
   name text
);

create table discog.Releases(
   release_id integer,
   title text,
   num_tracks integer,
   released text,
   country text
);

create table discog.Releases_Artists(
   release_id integer,
   artist_id integer
);

create table discog.Releases_Formats(
   release_id integer,
   format_type text
);

create table discog.Releases_Genres(
   release_id integer,
   genre_id integer
);

create table discog.Releases_Labels(
   release_id integer,
   label_id integer
);
