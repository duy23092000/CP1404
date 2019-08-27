"""
Name: Nguyen Quang Duy
Date started: 10/8/2019
Program: Travel Tracking
GitHub URL: https://github.com/duy23092000/CP1404
"""
input_file = open("places.csv","r")
FILES = input_file.readlines()
TOTAL = [0]
REMAINDER = [1]
EXPORT_LIST = []

def main():
    print("Travel Tracker 1.0 - by <Nguyen Quang Duy>")
    first = menu()
def menu():
    print("L - List place")
    print("A - Add a new place")
    print("M - Mark a place as visited")
    print("Q - Quit")
    option = input("Please select your option").upper()
    print("-" * 86)
    while option not in ['L', 'A', 'M', 'Q']:
        option = input("Invalid choice, please make another option").upper()
    if option == "L":
        list()
    elif option == "A":
        add()
    elif option == "M":
        mark()
    elif option == "Q"
        confirm = input("Are you sure you want to quit? - (Y) Yes, (N) No ").upper()
        while confirm not in ['Y','N']:
            confirm = input("Invalid choice, please make another option").upper()
        if confirm == "Y":
            print("=> Updated to your list has been saved")
            print("-- Quit list --")
        else:
            menu()
def list():
    list = []
    count = 0
    count_2 = 0
    for lines in FILES:
        count += 1
        new_lines = lines.split(",")
        place_name = new_lines[0]
        country_name = new_lines[1]
        priority = new_lines[2]
        status = new_lines[3].replace("v", "*").replace("n", "").replace("\n", "")
        list.append(count)
        final_place_list = ("{:>2}. {:<1} {:<35} - {:<35} ({})".format(count, status, place_name, country_name, priority))
        print(final_place_list)
        if "*" in status:
            count_2 += 1
    print("-" * 86)
    print("Total number of places:", max(list))
    TOTAL.append(max(list))
    print("Number of places visited:", max(list) - count_2)
    print("Number of places left to visit:", count_2)
    REMAINDER.append(count_2)
    print("-" * 86)
    menu()

def add():
    remove_status ="v\n"
    place_name2 = input("Enter a place:")
    while place_name2 in ["", " ", "  ", "   "]:
        print("Enter a place's name, please!")
        place_name2 = input("Enter a place:")
    country_name2 = input("Enter a country:")
    while country_name2 in ["", " ", "  ", "   "]:
        print("Enter a country's name, please!")
        country_name2 = input("Enter a country:")
    flag=True
    while (flag==True):
        try:
            priority_2 = int(input("Enter priority: "))
            flag = False
        except ValueError:
            print("Invalid input, please enter a number")
    if REMAINDER[-1] == 0:
        REMAINDER.remove(REMAINDER[-1])
    result_1 = ("{},{},{},{}".format(place_name2, country_name2, priority_2, remove_status))
    FILES.append(result_1)
    EXPORT_LIST.append(result_1)
    print("{} from {} with priority ({}) added to place list".format(place_name2, country_name2, priority_2))
    print("-" * 86)
    menu()

def mark():
    remove_status = "v\n"
    if min(REMAINDER) == 0:
        print("No more places to visit!")
        print("-" * 86)
        menu()
    flag=True
    while (flag==True):
        try:
            number = int(input("Enter the number of a place to be marked as visited"))
            flag = False
        except ValueError:
            print("Invalid input, please enter a number")
    if max(TOTAL) == 0:
        print("Please load the place list again and then proceed to input place number value")
        menu()
    while number > max(TOTAL):
        print("Invalid input, please enter another value")
        number = int(input("Enter the number of a place to be marked as visited"))
    rows = FILES[number - 1]
    new_rows = rows.split(",")
    place_name3 = new_rows[0]
    country_name3 = new_rows[1]
    priority_3 = new_rows[2]
    result_3 = ("{},{},{},{}".format(place_name3, country_name3, priority_3, remove_status))
    result_4 = ("=> '{} from {} with priority {}' visited".format(place_name3, country_name3, priority_3))
    FILES.append(result_3)
    FILES.remove(FILES[number - 1])
    print(result_4)
    print("-" * 86)
    menu()

def quitApp():
    f = open('testFile.csv','w')
    for line in FILES:
        f.write(line)
    f.close()
main()









