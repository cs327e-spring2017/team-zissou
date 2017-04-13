set search_path=discog;

create or replace function get_utf8_bytes(col varchar(max))
returns int
stable AS $$
import sys
reload(sys)
sys.setdefaultencoding('utf-8')
return len(col.encode('utf-8'))
$$ language plpythonu;


# Fixing discog.artists.name and discog.artists.realname
alter table discog.artists add column cname varchar(149);
update discog.artists set cname = name;
update discog.artists set cname = initcap(btrim(split_part(cname,
'(' , 1)));
update discog.artists set cname = initcap(btrim(split_part(cname,
';' , 1)));
update discog.artists set cname = initcap(btrim(split_part(cname,
'/' , 1)));
update discog.artists set cname = initcap(btrim(split_part(cname,
'[' , 1)));
update discog.artists set cname = initcap(btrim(split_part(cname,
':' , 1)));
update discog.artists set cname = initcap(btrim(split_part(cname,
'-' , 1)));
update discog.artists set cname = initcap(btrim(split_part(cname,
'...' , 1)));
update discog.artists set cname = initcap(btrim(split_part(cname,
'with' , 1)));
update discog.artists set cname = initcap(btrim(split_part(cname,
'Vs.' , 1)));

alter table discog.artists add column crealname varchar(244);
update discog.artists set crealname = realname;
update discog.artists set crealname = initcap(btrim(split_part(crealname,
'(' , 1)));
update discog.artists set crealname = initcap(btrim(split_part(crealname,
';' , 1)));
update discog.artists set crealname = initcap(btrim(split_part(crealname,
'/' , 1)));
update discog.artists set crealname = initcap(btrim(split_part(crealname,
'[' , 1)));
update discog.artists set crealname = initcap(btrim(split_part(crealname,
':' , 1)));
update discog.artists set crealname = initcap(btrim(split_part(crealname,
'-' , 1)));
update discog.artists set crealname = initcap(btrim(split_part(crealname,
'...' , 1)));
update discog.artists set crealname = initcap(btrim(split_part(crealname,
'with' , 1)));
update discog.artists set crealname = initcap(btrim(split_part(crealname,
'Vs.' , 1)));


#Fixing discog.labels.name
alter table discog.labels add column cname varchar(255);
update discog.labels set cname = name;
update discog.labels set cname = initcap(btrim(split_part(cname,
'(' , 1)));
update discog.labels set cname = initcap(btrim(split_part(cname,
';' , 1)));
update discog.labels set cname = initcap(btrim(split_part(cname,
'/' , 1)));
update discog.labels set cname = initcap(btrim(split_part(cname,
'[' , 1)));
update discog.labels set cname = initcap(btrim(split_part(cname,
':' , 1)));
update discog.labels set cname = initcap(btrim(split_part(cname,
'-' , 1)));
update discog.labels set cname = initcap(btrim(split_part(cname,
'...' , 1)));
update discog.labels set cname = initcap(btrim(split_part(cname,
'with' , 1)));
update discog.labels set cname = initcap(btrim(split_part(cname,
'Vs.' , 1)));


#Fixing discog.genres.title
alter table discog.releases add column ctitle varchar(245);
update discog.releases set ctitle = title;
update discog.releases set ctitle = initcap(btrim(split_part(ctitle,
'(' , 1)));
update discog.releases set ctitle = initcap(btrim(split_part(ctitle,
';' , 1)));
update discog.releases set ctitle = initcap(btrim(split_part(ctitle,
'/' , 1)));
update discog.releases set ctitle = initcap(btrim(split_part(ctitle,
'[' , 1)));
update discog.releases set ctitle = initcap(btrim(split_part(ctitle,
':' , 1)));
update discog.releases set ctitle = initcap(btrim(split_part(ctitle,
'-' , 1)));
update discog.releases set ctitle = initcap(btrim(split_part(ctitle,
'...' , 1)));
update discog.releases set ctitle = initcap(btrim(split_part(ctitle,
'with' , 1)));
update discog.releases set ctitle = initcap(btrim(split_part(ctitle,
'Vs.' , 1)));













