set search_path=musicbrainz;

copy artist from
's3://cs327e-final-project-datasets/music-brainz-csv/artist.csv'
iam_role 'arn:aws:iam::659249333008:role/redshift_s3_role'
region 'us-east-1'
csv quote '"' ignoreheader 1 trimblanks compupdate ON
maxerror 50;

copy artist_alias from
's3://cs327e-final-project-datasets/music-brainz-csv/artist_alias.csv'
iam_role 'arn:aws:iam::659249333008:role/redshift_s3_role'
region 'us-east-1'
csv quote '"' ignoreheader 1 trimblanks compupdate ON
maxerror 50;

copy artist_alias_type from
's3://cs327e-final-project-datasets/music-brainz-csv/artist_alias_type.csv'
iam_role 'arn:aws:iam::659249333008:role/redshift_s3_role'
region 'us-east-1'
csv quote '"' ignoreheader 1 trimblanks compupdate ON
maxerror 50;

copy artist_credit_name from
's3://cs327e-final-project-datasets/music-brainz-csv/artist_credit_name.csv'
iam_role 'arn:aws:iam::659249333008:role/redshift_s3_role'
region 'us-east-1'
csv quote '"' ignoreheader 1 trimblanks compupdate ON
maxerror 50;

copy artist_type from
's3://cs327e-final-project-datasets/music-brainz-csv/artist_type.csv'
iam_role 'arn:aws:iam::659249333008:role/redshift_s3_role'
region 'us-east-1'
csv quote '"' ignoreheader 1 trimblanks compupdate ON
maxerror 50;

copy label from
's3://cs327e-final-project-datasets/music-brainz-csv/label.csv'
iam_role 'arn:aws:iam::659249333008:role/redshift_s3_role'
region 'us-east-1'
csv quote '"' ignoreheader 1 trimblanks compupdate ON
maxerror 50;

copy label_alias from
's3://cs327e-final-project-datasets/music-brainz-csv/label_alias.csv'
iam_role 'arn:aws:iam::659249333008:role/redshift_s3_role'
region 'us-east-1'
csv quote '"' ignoreheader 1 trimblanks compupdate ON
maxerror 50;

copy label_alias_type from
's3://cs327e-final-project-datasets/music-brainz-csv/label_alias_type.csv'
iam_role 'arn:aws:iam::659249333008:role/redshift_s3_role'
region 'us-east-1'
csv quote '"' ignoreheader 1 trimblanks compupdate ON
maxerror 50;

copy language from
's3://cs327e-final-project-datasets/music-brainz-csv/language.csv'
iam_role 'arn:aws:iam::659249333008:role/redshift_s3_role'
region 'us-east-1'
csv quote '"' ignoreheader 1 trimblanks compupdate ON
maxerror 50;

copy medium from
's3://cs327e-final-project-datasets/music-brainz-csv/medium.csv'
iam_role 'arn:aws:iam::659249333008:role/redshift_s3_role'
region 'us-east-1'
csv quote '"' ignoreheader 1 trimblanks compupdate ON
maxerror 50;

copy medium_format from
's3://cs327e-final-project-datasets/music-brainz-csv/medium_format.csv'
iam_role 'arn:aws:iam::659249333008:role/redshift_s3_role'
region 'us-east-1'
csv quote '"' ignoreheader 1 trimblanks compupdate ON
maxerror 50;

copy release from
's3://cs327e-final-project-datasets/music-brainz-csv/release.csv'
iam_role 'arn:aws:iam::659249333008:role/redshift_s3_role'
region 'us-east-1'
csv quote '"' ignoreheader 1 trimblanks compupdate ON
maxerror 50;

copy release_alias from
's3://cs327e-final-project-datasets/music-brainz-csv/release_alias.csv'
iam_role 'arn:aws:iam::659249333008:role/redshift_s3_role'
region 'us-east-1'
csv quote '"' ignoreheader 1 trimblanks compupdate ON
maxerror 50;

copy release_alias_type from
's3://cs327e-final-project-datasets/music-brainz-csv/release_alias_type.csv'
iam_role 'arn:aws:iam::659249333008:role/redshift_s3_role'
region 'us-east-1'
csv quote '"' ignoreheader 1 trimblanks compupdate ON
maxerror 50;

copy release_group from
's3://cs327e-final-project-datasets/music-brainz-csv/release_group.csv'
iam_role 'arn:aws:iam::659249333008:role/redshift_s3_role'
region 'us-east-1'
csv quote '"' ignoreheader 1 trimblanks compupdate ON
maxerror 50;

copy release_group_alias from
's3://cs327e-final-project-datasets/music-brainz-csv/release_group_alias.csv'
iam_role 'arn:aws:iam::659249333008:role/redshift_s3_role'
region 'us-east-1'
csv quote '"' ignoreheader 1 trimblanks compupdate ON
maxerror 50;

copy release_group_primary_type from
's3://cs327e-final-project-datasets/music-brainz-csv/release_group_primary_type.csv'
iam_role 'arn:aws:iam::659249333008:role/redshift_s3_role'
region 'us-east-1'
csv quote '"' ignoreheader 1 trimblanks compupdate ON
maxerror 50;

copy release_group_secondary_type from
's3://cs327e-final-project-datasets/music-brainz-csv/release_group_secondary_type.csv'
iam_role 'arn:aws:iam::659249333008:role/redshift_s3_role'
region 'us-east-1'
csv quote '"' ignoreheader 1 trimblanks compupdate ON
maxerror 50;

copy release_label from
's3://cs327e-final-project-datasets/music-brainz-csv/release_label.csv'
iam_role 'arn:aws:iam::659249333008:role/redshift_s3_role'
region 'us-east-1'
csv quote '"' ignoreheader 1 trimblanks compupdate ON
maxerror 50;

copy track from
's3://cs327e-final-project-datasets/music-brainz-csv/track.csv'
iam_role 'arn:aws:iam::659249333008:role/redshift_s3_role'
region 'us-east-1'
csv quote '"' ignoreheader 1 trimblanks compupdate ON
maxerror 50;

copy work from
's3://cs327e-final-project-datasets/music-brainz-csv/work.csv'
iam_role 'arn:aws:iam::659249333008:role/redshift_s3_role'
region 'us-east-1'
csv quote '"' ignoreheader 1 trimblanks compupdate ON
maxerror 50;
