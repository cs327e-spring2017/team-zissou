set search_path=musicbrainz;


create or replace function get_utf8_bytes(col varchar(max))
returns int
stable AS $$
import sys
reload(sys)
sys.setdefaultencoding('utf-8')
return len(col.encode('utf-8'))
$$ language plpythonu;


--Fixing musicbrainz.artist.name
alter table musicbrainz.Artist add column cname varchar(167);
update musicbrainz.Artist set cname = name;
update musicbrainz.Artist set cname = initcap(btrim(split_part(cname,
';' , 1)));
update musicbrainz.Artist set cname = initcap(btrim(split_part(cname,
'/' , 1)));
update musicbrainz.Artist set cname = initcap(btrim(split_part(cname,
'(' , 1)));
update musicbrainz.Artist set cname = initcap(btrim(split_part(cname,
'[' , 1)));
update musicbrainz.Artist set cname = initcap(btrim(split_part(cname,
':' , 1)));
update musicbrainz.Artist set cname = initcap(btrim(split_part(cname,
'-' , 1)));
update musicbrainz.Artist set cname = initcap(btrim(split_part(cname,
'...' , 1)));
update musicbrainz.Artist set cname = initcap(btrim(split_part(cname,
'with' , 1)));
update musicbrainz.Artist set cname = initcap(btrim(split_part(cname,
'Vs' , 1)));

--Fixing musicbrainz.artist_credit.name
alter table musicbrainz.Artist_credit add column cname varchar(2);
update musicbrainz.Artist_credit set cname = name;
update musicbrainz.Artist_credit set cname = initcap(btrim(split_part(cname,
';' , 1)));
update musicbrainz.Artist_credit set cname = initcap(btrim(split_part(cname,
'/' , 1)));
update musicbrainz.Artist_credit set cname = initcap(btrim(split_part(cname,
'(' , 1)));
update musicbrainz.Artist_credit set cname = initcap(btrim(split_part(cname,
'[' , 1)));
update musicbrainz.Artist_credit set cname = initcap(btrim(split_part(cname,
':' , 1)));
update musicbrainz.Artist_credit set cname = initcap(btrim(split_part(cname,
'-' , 1)));
update musicbrainz.Artist_credit set cname = initcap(btrim(split_part(cname,
'...' , 1)));
update musicbrainz.Artist_credit set cname = initcap(btrim(split_part(cname,
'with' , 1)));
update musicbrainz.Artist_credit set cname = initcap(btrim(split_part(cname,
'Vs' , 1)));

--Fixing musicbrainz.medium_format.name
alter table musicbrainz.Medium_format add column cname varchar(25);
update musicbrainz.Medium_format set cname = name;
update musicbrainz.Medium_format set cname = initcap(btrim(split_part(cname,
';' , 1)));
update musicbrainz.Medium_format set cname = initcap(btrim(split_part(cname,
'/' , 1)));
update musicbrainz.Medium_format set cname = initcap(btrim(split_part(cname,
'(' , 1)));
update musicbrainz.Medium_format set cname = initcap(btrim(split_part(cname,
'[' , 1)));
update musicbrainz.Medium_format set cname = initcap(btrim(split_part(cname,
':' , 1)));
update musicbrainz.Medium_format set cname = initcap(btrim(split_part(cname,
'-' , 1)));
update musicbrainz.Medium_format set cname = initcap(btrim(split_part(cname,
'...' , 1)));
update musicbrainz.Medium_format set cname = initcap(btrim(split_part(cname,
'with' , 1)));
update musicbrainz.Medium_format set cname = initcap(btrim(split_part(cname,
'Vs' , 1)));

--Fixing musicbrainz.Lable.name
alter table musicbrainz.Label add column cname varchar(118);
update musicbrainz.Label set cname = name;
update musicbrainz.Label set cname = initcap(btrim(split_part(cname,
';' , 1)));
update musicbrainz.Label set cname = initcap(btrim(split_part(cname,
'/' , 1)));
update musicbrainz.Label set cname = initcap(btrim(split_part(cname,
'(' , 1)));
update musicbrainz.Label set cname = initcap(btrim(split_part(cname,
'[' , 1)));
update musicbrainz.Label set cname = initcap(btrim(split_part(cname,
':' , 1)));
update musicbrainz.Label set cname = initcap(btrim(split_part(cname,
'-' , 1)));
update musicbrainz.Label set cname = initcap(btrim(split_part(cname,
'...' , 1)));
update musicbrainz.Label set cname = initcap(btrim(split_part(cname,
'with' , 1)));
update musicbrainz.Label set cname = initcap(btrim(split_part(cname,
'Vs' , 1)));



alter table musicbrainz.Release add column cname varchar(255);
update musicbrainz.Release set cname = name;
update musicbrainz.Release set cname = initcap(btrim(split_part(cname,
';' , 1)));
update musicbrainz.Release set cname = initcap(btrim(split_part(cname,
'/' , 1)));
update musicbrainz.Release set cname = initcap(btrim(split_part(cname,
'(' , 1)));
update musicbrainz.Release set cname = initcap(btrim(split_part(cname,
'[' , 1)));
update musicbrainz.Release set cname = initcap(btrim(split_part(cname,
':' , 1)));
update musicbrainz.Release set cname = initcap(btrim(split_part(cname,
'-' , 1)));
update musicbrainz.Release set cname = initcap(btrim(split_part(cname,
'...' , 1)));
update musicbrainz.Release set cname = initcap(btrim(split_part(cname,
'with' , 1)));
update musicbrainz.Release set cname = initcap(btrim(split_part(cname,
'Vs' , 1)));

select name from musicbrainz.Release order by random() limit 50;


alter table musicbrainz.artist_credit_name add column cname varchar(244);
update musicbrainz.artist_credit_name set cname = name;
update musicbrainz.artist_credit_name set cname = initcap(btrim(split_part(cname,
';' , 1)));
update musicbrainz.artist_credit_name set cname = initcap(btrim(split_part(cname,
'/' , 1)));
update musicbrainz.artist_credit_name set cname = initcap(btrim(split_part(cname,
'(' , 1)));
update musicbrainz.artist_credit_name set cname = initcap(btrim(split_part(cname,
'[' , 1)));
update musicbrainz.artist_credit_name set cname = initcap(btrim(split_part(cname,
':' , 1)));
update musicbrainz.artist_credit_name set cname = initcap(btrim(split_part(cname,
'-' , 1)));
update musicbrainz.artist_credit_name set cname = initcap(btrim(split_part(cname,
'...' , 1)));
update musicbrainz.artist_credit_name set cname = initcap(btrim(split_part(cname,
'with' , 1)));
update musicbrainz.artist_credit_name set cname = initcap(btrim(split_part(cname,
'Vs' , 1)));


alter table musicbrainz.release_group add column cname varchar(255);
update musicbrainz.release_group set cname = name;
update musicbrainz.release_group set cname = initcap(btrim(split_part(cname,
';' , 1)));
update musicbrainz.release_group set cname = initcap(btrim(split_part(cname,
'/' , 1)));
update musicbrainz.release_group set cname = initcap(btrim(split_part(cname,
'(' , 1)));
update musicbrainz.release_group set cname = initcap(btrim(split_part(cname,
'[' , 1)));
update musicbrainz.release_group set cname = initcap(btrim(split_part(cname,
':' , 1)));
update musicbrainz.release_group set cname = initcap(btrim(split_part(cname,
'-' , 1)));
update musicbrainz.release_group set cname = initcap(btrim(split_part(cname,
'...' , 1)));
update musicbrainz.release_group set cname = initcap(btrim(split_part(cname,
'with' , 1)));
update musicbrainz.release_group set cname = initcap(btrim(split_part(cname,
'Vs' , 1)));



alter table musicbrainz.Track add column cname varchar(1904);
update musicbrainz.Track set cname = name;
update musicbrainz.Track set cname = initcap(btrim(split_part(cname,
';' , 1)));
update musicbrainz.Track set cname = initcap(btrim(split_part(cname,
'/' , 1)));
update musicbrainz.Track set cname = initcap(btrim(split_part(cname,
'(' , 1)));
update musicbrainz.Track set cname = initcap(btrim(split_part(cname,
'[' , 1)));
update musicbrainz.Track set cname = initcap(btrim(split_part(cname,
':' , 1)));
update musicbrainz.Track set cname = initcap(btrim(split_part(cname,
'-' , 1)));
update musicbrainz.Track set cname = initcap(btrim(split_part(cname,
'...' , 1)));
update musicbrainz.Track set cname = initcap(btrim(split_part(cname,
'with' , 1)));
update musicbrainz.Track set cname = initcap(btrim(split_part(cname,
'Vs' , 1)));
