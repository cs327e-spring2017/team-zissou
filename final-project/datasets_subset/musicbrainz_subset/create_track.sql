create table Track(
   id integer,
   gid text,
   recording integer,
   medium integer,
   position boolean,
   number boolean,
   name text,
   artist_credit integer,
   length integer,
   edits_pending boolean,
   last_updated decimal(29,3),
   is_data_track text
);