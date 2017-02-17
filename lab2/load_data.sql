\c imdb;

\copy Movies from '/Users/Pabs/Desktop/csv_dataset_full/movies.csv' (header TRUE, format csv, delimiter ',', encoding 'UTF8');

\copy Genres from '/Users/Pabs/Desktop/csv_dataset_full/genres.csv' (header TRUE, format csv, delimiter ',', encoding 'UTF8');

\copy Keywords from '/Users/Pabs/Desktop/csv_dataset_full/keywords.csv' (header TRUE, format csv, delimiter ',', encoding 'UTF8');

\copy Series from '/Users/Pabs/Desktop/csv_dataset_full/series.csv' (header TRUE, format csv, delimiter ',', encoding 'UTF8');

\copy Actors from '/Users/Pabs/Desktop/csv_dataset_full/actors.csv' (header TRUE, format csv, delimiter ',', encoding 'UTF8');

\copy Casts from '/Users/Pabs/Desktop/csv_dataset_full/cast.csv' (header TRUE, format csv, delimiter ',', encoding 'UTF8');

\copy Characters from '/Users/Pabs/Desktop/csv_dataset_full/aka_names.csv' (header TRUE, format csv, delimiter ',', encoding 'UTF8');
