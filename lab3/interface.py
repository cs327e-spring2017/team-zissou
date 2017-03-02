import sys
from queries import *

COMMAND_COUNT = 5
running = True

cursor = connect()
if cursor is None:
	print("Error: Unable to connect to the database")
	sys.exit()

while running:
	print("\n==============IMDB COMMAND MENU===================================")
	print("| 0. EXIT                                                        |")
	print("| 1. Number of movies in a given year                            |")
	print("| 2. Number of actors with a given last name                     |")
	print("| 3. Proportion of TV shows in IMDB in a given year              |")
	print("| 4. Number of movies for a given actor                          |")
	print("| 5. Average number of characters per movie in a given year      |")
	print("| 6. Average number of episodes per season for a given TV show   |")
	print("| 7. Series with greatest number of episodes in a given year     |")
	print("| 8. Most common last name in a given year                       |")
	print("| 9. Actor with the greatest number of rules in a given year     |")
	print("| 10. Top 5 movies/shows with largest cast in a given year       |")
	print("==================================================================\n")
	choice = input("Select a Option: ")

	try:
		choice = int(choice)
		if choice > COMMAND_COUNT:
			raise ValueError  
	except ValueError as err:
		print('Not a Valid Command.')
		continue
	
	if choice == 0:
		print('Exiting Command Menu...')
		running = False
	elif choice == 1:
		example_one(cursor)
	elif choice == 2:
		example_two(cursor)
	elif choice == 3:
		example_three(cursor)
