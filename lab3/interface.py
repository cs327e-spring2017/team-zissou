import sys
from queries import *

COMMAND_COUNT = 5
running = True

cursor = connect()
if cursor is None:
	print("Error: Unable to connect to the database")
	sys.exit()

while running:
	print("\n==============IMDB COMMAND MENU===============")
	print("| 0. EXIT                                    |")
	print("| 1. GET NUMBER OF ROW IN ACTORS             |")
	print("| 2. GET NUMBER OF MOVIES IN A CERTAIN YEAR  |")
	print("| 3. GET CAST INFORMATION OF A MOVIE         |")
	print("| 4. GET CAST INFORMATION OF A MOVIE         |")
	print("| 5. GET CAST INFORMATION OF A MOVIE         |")
	print("| 6. GET CAST INFORMATION OF A MOVIE         |")
	print("| 7. GET CAST INFORMATION OF A MOVIE         |")
	print("| 8. GET CAST INFORMATION OF A MOVIE         |")
	print("| 9. GET CAST INFORMATION OF A MOVIE         |")
	print("| 10. GET CAST INFORMATION OF A MOVIE        |")
	print("| 11. GET CAST INFORMATION OF A MOVIE        |")
	print("| 12. GET CAST INFORMATION OF A MOVIE        |")
	print("==============================================\n")
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
