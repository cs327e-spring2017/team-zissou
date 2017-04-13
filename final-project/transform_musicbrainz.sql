set search_path=musicbrainz;

create or replace function get_utf8_bytes(col varchar(max))
returns int
stable AS $$
import sys
reload(sys)
sys.setdefaultencoding('utf-8')
return len(col.encode('utf-8'))
$$ language plpythonu;

select max(get_utf8_bytes(title)) from musicbrainz.Track;

alter table musicbrainz.Artist add column cname text;
update musicbrainz.Artist set cname = title;
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

select name from musicbrainz.Artist order by random() limit 50;

alter table musicbrainz.Label add column cname text;
update musicbrainz.Label set cname = title;
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

select name from musicbrainz.Label order by random() limit 50;

alter table musicbrainz.Release add column cname text;
update musicbrainz.Release set cname = title;
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
