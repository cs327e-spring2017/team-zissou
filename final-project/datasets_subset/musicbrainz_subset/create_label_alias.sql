create table Label_Alias(
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