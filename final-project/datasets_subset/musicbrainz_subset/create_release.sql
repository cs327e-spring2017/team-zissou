create table Release(
   id integer,
   gid text,
   name text,
   artist_credit integer,
   release_group integer,
   status boolean,
   packaging boolean,
   language integer,
   script integer,
   barcode integer,
   comment text,
   edits_pending boolean,
   quality text,
   last_updated decimal(29,3)
);