# Feel free to define your own helper methods.
import psycopg2
from config import db

def connect():
    try:
        conn = psycopg2.connect(
            "dbname='" + db['DATABASE'] + "'" + 
            "user='" + db['USER'] + "'" + 
            "host='" + db['HOST'] + "'" + 
            "password='" + db['PASSWORD'] + "'"
            )
        cursor = conn.cursor()
        return cursor
    except:
        return None

def print_table(table):
    print("\n====RESULT TABLE====")

    cols = len(table[0])
    format_string = "%s " * cols
    for row in table:
        print (format_string % tuple(row))
    print("====================\n")


def run_query(query, cursor):
    cursor.execute(query)
    rows = cursor.fetchall()
    colnames = [desc[0] for desc in cursor.description]
    rows.insert(0, colnames)
    return rows

def example_one(cursor):
    query = "SELECT count(*) from actors"
    result = run_query(query, cursor)
    print_table(result)

def example_two(cursor):
    year = input('Choose a year: ')
    query = "SELECT count(*) from movies where year = " + year + ";"
    result = run_query(query, cursor)
    print_table(result)

def example_three(cursor):
    title = input('Choose a movie: ')

    query = "SELECT idmovies, title, year from movies where title = '" + title + "' and type = 'FF' ORDER BY year ASC;"
    movie_id_table = run_query(query, cursor)

    if len(movie_id_table) > 2:
        print_table(movie_id_table)
        movie_id = input('Pick a movie id: ')

        query = "SELECT character, fname, lname, genders FROM casts INNER JOIN actors on casts.idactors = actors.idactors where idmovies = " + movie_id + ";"
        result = run_query(query, cursor)

        print_table(result)
    else:
        print('No movie correspondes to the title: ' + title)

def query_one(cursor):
    year = input('Choose a year: ')
    query = \
        'select count(movie_id) from Movies where year={};'.format(year)
    result = run_query(query, cursor)
    print_table(result)

def query_two(cursor):
    last_name = input('Choose a last name: ')
    query = \
        'select count(actor_id) from Actors where last_name=\'{}\';'.format(last_name)
    result = run_query(query, cursor)
    print_table(result)

def query_three(cursor):
    year = input('Choose a year: ')
    query = \
        'select cast(count(series_id) as float)/cast(count(*) as float) as prop_show \
         from Movies m full join Series s on m.movie_id = s.series_id \
         where year={};'.format(year)
    result = run_query(query, cursor)
    print_table(result)

def query_four(cursor):
    name = input('Enter an actor\'s name (format: last name, first name): ')
    last_name, first_name = [x.strip() for x in name.split(',')]
    query = \
        'select count(distinct movie_id) \
         from Casts c inner join Actors a on c.actor_id = a.actor_id \
         where first_name=\'{}\' and last_name=\'{}\';'.format(first_name, last_name)
    result = run_query(query, cursor)
    print_table(result)

def query_five(cursor):
    year = input('Choose a year: ')
    query = \
        'select avg(num_chars) \
         from (select m.movie_id, count(char_id) as num_chars \
               from Characters a inner join Casts b on a.actor_id = b.actor_id \
               inner join Movies m on b.movie_id = m.movie_id \
               group by m.movie_id, series_id \
               having year={} and series_id is null) as temp;'.format(year)
    result = run_query(query, cursor)
    print_table(result)

def query_six(cursor):
    name = input('Enter a show name: ')
    query = \
        'select avg(num_episodes) \
         from (select s.movie_id, season, title, count(series_id) as num_episodes \
               from Series s left join Movies m on s.movie_id = m.movie_id \
               group by s.movie_id, season, title \
               having title=\'{}\') as temp;'.format(name)
    result = run_query(query, cursor)
    print_table(result)

def query_seven():
    year = input('Select a year: ')
    query = "select count(episode_num) as epi_num_occurance from Series group by episode_num order by epi_num_occurance desc limit 1;"
    result = run_query(query, cursor)
    print_table(result)

def query_eight():
    query = "select last_name from Actors group by last_name order by count(*) limit 1;"
    result = run_query(query, cursor)
    print_table(result)

def query_nine():
    query = "select Actors.actor_id, Actors.last_name, Actors.first_name from Actors inner join Casts on Actors.actor_id = Casts.actor_id group by Actors.actor_id order by count(*) desc limit 1;"
    result = run_query(query, cursor)
    print_table(result)

def query_ten():
    year_ = input('Choose a year: ')
    query = "select  m.movie_id, m.title, m.year from Movies m inner join Casts c on m.movie_id = c.movie_id where year = " + year_ + " ' group by m.movie_id, m.title order by count(*) desc limit 5;"
    result = run_query(query, cursor)
    print_table(result)