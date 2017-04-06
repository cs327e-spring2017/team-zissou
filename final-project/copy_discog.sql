set search_path=discog;

copy artists from
's3://cs327e-final-project-datasets/discog-csv/artists.csv'
iam_role 'arn:aws:iam::186916653208:role/redshift_s3_role'
region 'us-east-1'
csv quote '"' ignoreheader 1 trimblanks compupdate ON
maxerror 50;

copy genres from
's3://cs327e-final-project-datasets/discog-csv/genres.csv'
iam_role 'arn:aws:iam::186916653208:role/redshift_s3_role'
region 'us-east-1'
csv quote '"' ignoreheader 1 trimblanks compupdate ON
maxerror 50;

copy labels from
's3://cs327e-final-project-datasets/discog-csv/labels.csv'
iam_role 'arn:aws:iam::186916653208:role/redshift_s3_role'
region 'us-east-1'
csv quote '"' ignoreheader 1 trimblanks compupdate ON
maxerror 50;

copy releases from
's3://cs327e-final-project-datasets/discog-csv/releases.csv'
iam_role 'arn:aws:iam::186916653208:role/redshift_s3_role'
region 'us-east-1'
csv quote '"' ignoreheader 1 trimblanks compupdate ON
maxerror 50;

copy releases_artists from
's3://cs327e-final-project-datasets/discog-csv/releases_artists.csv'
iam_role 'arn:aws:iam::186916653208:role/redshift_s3_role'
region 'us-east-1'
csv quote '"' ignoreheader 1 trimblanks compupdate ON
maxerror 50;

copy releases_formats from
's3://cs327e-final-project-datasets/discog-csv/releases_formats.csv'
iam_role 'arn:aws:iam::186916653208:role/redshift_s3_role'
region 'us-east-1'
csv quote '"' ignoreheader 1 trimblanks compupdate ON
maxerror 50;

copy releases_genres from
's3://cs327e-final-project-datasets/discog-csv/releases_genres.csv'
iam_role 'arn:aws:iam::186916653208:role/redshift_s3_role'
region 'us-east-1'
csv quote '"' ignoreheader 1 trimblanks compupdate ON
maxerror 50;

copy releases_labels from
's3://cs327e-final-project-datasets/discog-csv/releases_labels.csv'
iam_role 'arn:aws:iam::186916653208:role/redshift_s3_role'
region 'us-east-1'
csv quote '"' ignoreheader 1 trimblanks compupdate ON
maxerror 50;
