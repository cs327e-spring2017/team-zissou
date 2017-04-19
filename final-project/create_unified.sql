drop schema if exists unified;

create schema unified;

set search_path=discog,musicbrainz,unified;

--Releases from both schemas + their join table

create table unified.D_Releases as
	select release_id, ctitle as title, num_tracks, released, country
	from discog.Releases;

create table unified.MB_Releases as
	select id as release_id, cname as title, language
	from musicbrainz.Release;

create table unified.Release_Join as
	select dr.title, dr.release_id as discog_id, mr.release_id as mb_id
	from unified.D_Releases dr join unified.MB_Releases mr on dr.release_id = mr.release_id;

--Artists from both schemas + their join table

create table unified.D_Artists as
	select tist_id as artist_id, cname as name, crealname as realname
	from discog.Artists;

create table unified.MB_Artist as
	select id, cname as name
	from musicbrainz.Artist;

create table unified.Artist_Join as
	select da.name, da.artist_id as discog_id, ma.id as mb_id
	from unified.D_Artists da join unified.MB_Artist ma on da.artist_id = ma.id;

--Labels from both schemas + their join table

create table unified.D_Labels as
	select tist_id as label_id, cname as name
	from discog.Artists;

create table unified.MB_Label as
	select id, cname as name, type
	from musicbrainz.Artist;

create table unified.Label_Join as
	select dl.name, dl.label_id as disc_id, ml.id as mb_id
	from unified.D_Labels dl join unified.MB_Label ml on dl.label_id = ml.id;

--all other tables (no joins needed)

create table unified.D_Release_Artists as
	select release_id, artist_id
	from discog.Releases_Artists;

create table unified.D_Releases_Labels as
	select release_id, label_id
	from discog.Releases_Labels;

create table unified.MB_Artist_credit as
	select id, artist_count, cname as name
	from musicbrainz.Artist_credit;

create table unified.MB_Medium_format as
	select id, cname as name
	from musicbrainz.Medium_format;

create table unified.MB_Medium as
	select id, release, format, name
	from musicbrainz.Medium;

create table unified.D_Genre as
	select genre_id, name
	from discog.Genres;

create table unified.D_Releases_Genre as
	select release_id, genre_id
	from discog.releases_genres;

create table unified.MB_Artists_credit_name as
	select artist_credit, artist, cname as name
	from musicbrainz.Artist_credit_name;

create table unified.MB_Release_Group as
	select id, cname as name, artist_credit, type
	from musicbrainz.release_group;

create table unified.MB_Track as
	select id, medium, cname as name, artist_credit
	from musicbrainz.Track;

create table unified.MB_Release_Label as
	select id, release, label
	from musicbrainz.Release_Label;