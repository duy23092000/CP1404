from place import Place
from operator import attrgetter

class Placelist:

    '''initiate the self attribute place_list calls to the load places to immediately update the place list'''

    def __init__(self):
        self.lists = []

    def load_places(self):

        '''open and load places.csv file'''

        infile = open("places_backup.csv", 'r')
        lines = infile.readlines()
        for line in lines:
            place_item = line.split(',')
            place_item[3] = place_item[3].strip('\n')
            loaded_place = Place(place_item[0],place_item[1],place_item[2],place_item[3])
            self.lists.append(loaded_place)
        infile.close()

    def sort(self,key):

        '''Sort the place list based on the spinner and selected'''

        self.lists = sorted(self.lists, key=attrgetter(key, "Name"))

    def add_to_list(self, name, country, priority, visited):

        '''Append new place to the place list'''

        newSong = Place(name, country, priority, 'v')
        self.lists.append(newSong)

    def save_places(self):

        '''Save all changes in the places.csv file'''

        out_file = open("places_backup.csv","w")
        out_file.seek(0)
        csv_string = ""
        for each in self.lists:
            csv_string += "{},{},{},{}\n".format(each.name, each.country, each.priority, each.visited)
        out_file.write(csv_string)
        out_file.close()