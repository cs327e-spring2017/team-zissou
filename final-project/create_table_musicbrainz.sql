drop schema if exists musicbrainz;

create schema musicbrainz;

create table musicbrainz.Artist(
   id integer,
   gid text,
   name text,
   sort_name text,
   begin_date_year text,
   begin_date_month text,
   begin_date_day text,
   end_date_year text,
   end_date_month text,
   end_date_day text,
   type integer,
   area text,
   gender text,
   comment text,
   edits_pending boolean,
   last_updated text,
   ended text,
   begin_area text,
   end_area text
);

create table musicbrainz.Artist_Alias(
   id integer,
   artist integer,
   name text,
   locale text,
   edits_pending boolean,
   last_updated decimal(29,3),
   type text,
   sort_name text,
   begin_date_year text,
   begin_date_month text,
   begin_date_day text,
   end_date_year text,
   end_date_month text,
   end_date_day text,
   primary_for_locale text,
   ended text
);

create table musicbrainz.Artist_Alias_Type(
   id integer,
   name text,
   parent text,
   child_order boolean,
   description text,
   gid text
);

create table musicbrainz.Artist_Credit_Name(
   artist_credit integer,
   position boolean,
   artist integer,
   name text,
   join_phrase text
);

create table musicbrainz.Artist_Type(
   id integer,
   name text,
   parent text,
   child_order integer,
   description text,
   gid text
);

create table musicbrainz.Label(
   id integer,
   gid text,
   name text,
   begin_date_year text,
   begin_date_month text,
   begin_date_day text,
   end_date_year text,
   end_date_month text,
   end_date_day text,
   label_code text,
   type text,
   area integer,
   comment text,
   edits_pending boolean,
   last_updated text,
   ended text
);

create table musicbrainz.Label_Alias(
   id integer,
   label integer,
   name text,
   locale text,
   edits_pending boolean,
   last_updated decimal(28,3),
   type integer,
   sort_name text,
   begin_date_year text,
   begin_date_month text,
   begin_date_day text,
   end_date_year text,
   end_date_month text,
   end_date_day text,
   primary_for_locale text,
   ended text
);

create table musicbrainz.Label_Alias_Type(
   id integer,
   name text,
   parent text,
   child_order boolean,
   description text,
   gid text
);

create table musicbrainz.Language(
   id integer,
   iso_code_2t text,
   iso_code_2b text,
   iso_code_1 text,
   name text,
   frequency boolean,
   iso_code_3 text
);

create table musicbrainz.Medium(
   id integer,
   release integer,
   position boolean,
   format boolean,
   name decimal(32,0),
   edits_pending boolean,
   last_updated decimal(29,3),
   track_count integer
);

create table musicbrainz.Medium_Format(
   id integer,
   name text,
   parent integer,
   child_order boolean,
   year integer,
   has_discids text,
   description text,
   gid text
);

create table musicbrainz.Release(
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

create table musicbrainz.Release_Alias(
   id integer,
   release integer,
   name text,
   locale text,
   edits_pending boolean,
   last_updated decimal(29,3),
   type text,
   sort_name text,
   begin_date_year text,
   begin_date_month text,
   begin_date_day text,
   end_date_year text,
   end_date_month text,
   end_date_day text,
   primary_for_locale text,
   ended text
);

create table musicbrainz.Release_Alias_Type(
   id integer,
   name text,
   parent text,
   child_order boolean,
   description text,
   gid text
);

create table musicbrainz.Release_Group(
   id integer,
   gid text,
   name text,
   artist_credit integer,
   type text,
   comment text,
   edits_pending boolean,
   last_updated decimal(29,3)
);

create table musicbrainz.Release_Group_Alias(
   id integer,
   release_id integer,
   name text,
   child_order text,
   description boolean,
   gid decimal(28,3)
);

create table musicbrainz.Release_Group_Primary_Type(
   id integer,
   name text,
   parent text,
   child_order integer,
   description text,
   gid text
);

create table musicbrainz.Release_Group_Secondary_Type(
   id integer,
   name text,
   parent text,
   child_order boolean,
   description text,
   gid text
);

create table musicbrainz.Release_Label(
   id integer,
   release integer,
   label integer,
   catalog_number text,
   last_updated decimal(29,3)
);

create table musicbrainz.Track(
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

create table musicbrainz.Work(
   id integer,
   gid text,
   name decimal(38,3),
   type text,
   comment text,
   edits_pending boolean,
   last_updated decimal(29,3),
   language text
);
