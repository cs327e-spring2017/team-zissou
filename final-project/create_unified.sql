create table unified.D_Releases as
	select release_id, ctitle as title, num_tracks, creleased as released, country
	from discog.Releases;

create table unified.MB_Releases as
	select release_id, ctitle as title, num_tracks, creleased as released, country
	from musicbrainz.Release;

create table unified.Release_Join as
	select d.name, d.release_id as d_id, m.id as mb_id
	from unified.D_Releases d join unified.MB_Releases mm on d.release_id = mb.id;