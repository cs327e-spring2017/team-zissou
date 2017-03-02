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

def query_two(cursor):
    last_name = input('Choose a last name: ')

def query_three(cursor):
    year = input('Choose a year: ')

def query_four(cursor):
    name = input('Enter an actor\'s name (format: last name, first name): ')
    first_name, last_name = x

def query_five(cursor):
    year = input('Choose a year: ')

def query_six(cursor):
    name = input('Enter a show name: ')

def query_seven(cursor):
    pass

def query_eight(cursor):
    pass

def query_nine(cursor):
    pass

def query_ten(cursor):
    pass

