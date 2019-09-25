"""
Name: NGUYEN QUANG DUY
Date of submission : 26/09/2019
Project purpose: This project opens the place list using kivy app of the place list ,
help the user interacts to find, mark and add the place they want
GitHub URL: https://github.com/duy23092000/CP1404
"""


from kivy.app import App
from kivy.lang import Builder
from kivy.properties import StringProperty, ListProperty
from kivy.uix.button import Button

from place import Place
from placelist import Placelist



class Travel(App):

    '''Create Travel App, The main program that demomstrate the place-list system'''

    current_sort = StringProperty()  # Define current sorting of song list
    sort_choices = ListProperty()

    message = StringProperty()
    message2 = StringProperty()

    new_lists = ["a","b", "c"]


    def __init__(self, **kwargs):

        '''Initiate the self.song_list to SongList() class'''

        super().__init__(**kwargs)
        self.placelist = Placelist()
        self.placelist.load_places()
        self.sort_choices = ["Name", "Country", "Priority", "Visited"]
        self.current_sort = self.sort_choices[0]
        self.message = "Hello"
        self.message2 = "Hello"

    def build(self):

        '''Build the Kivy GUI'''

        self.title = "TravelTracker"
        self.root = Builder.load_file('app.kv')
        self.create_widgets()
        return self.root


    def blank(self):
        self.root.ids.name.text = ""
        self.root.ids.country.text = ""
        self.root.ids.priority.text = ""

    def create_widgets(self):

        '''Create kivy app widget'''

        num_place = len(self.placelist.lists)
        visted_place = 0

        for place in self.placelist.lists:
             name = place.name
             country = place.country
             priority = place.priority
             visited = place.visited

             if visited == "n":
                 visted_place += 1
                 button_color = self.getColor(visited)
             else:
                 button_color = self.getColor(visited)

             button = Button(text = self.generateDisplayText(name,country,priority,visited), background_color  = button_color)
             button.bind(on_release = self.press_entry)
             self.root.ids.entriesBox.add_widget(button)
        self.message = "To visit: {}. Visited: {}".format(num_place - visted_place, visted_place)

    def press_entry(self, button):

        '''Handler for pressing entry buttons'''

        buttonText = button.text
        selectedPlace = Place()
        for place in self.placelist.lists:

            placeDisplayText = self.generateDisplayText(place.name, place.country, place.priority, place.visited)
            if buttonText == placeDisplayText:
                selectedPlace = place
                break
        if selectedPlace.visited =='v':
            selectedPlace.mark_unvisited()
        else:
            selectedPlace.mark_visited()
        self.root.ids.entriesBox.clear_widgets()
        self.create_widgets()

        self.message2 = "You have learned {}".format(selectedPlace.name)

    def generateDisplayText(self, name, country, priority, visited):

        '''Generate text on buttons'''

        if visited == "n":
            display_text = "{} by {} ({}) (Visited)".format(name, country, priority)
        else:
            display_text = "{} by {} ({})".format(name, country, priority)
        return display_text

    def change_sort(self, sorting_choice):

        '''Sorting list by:'''

        self.message = "Places have been sorted by: {}".format(sorting_choice)
        self.placelist.sort(sorting_choice)
        self.root.ids.entriesBox.clear_widgets()
        self.create_widgets()
        sort_index = self.sort_choices.index(sorting_choice)
        self.current_sort = self.sort_choices[sort_index]


    def getColor(self, visited):

        '''Make color for buttons'''

        if visited == "n":
            button_color = [1, 0, 0, 1]
        else:
            button_color = [0, 0, 1, 1]
        return button_color

    def add_places(self):

        '''Complete "Add Place" button'''

        if self.root.ids.name.text == "" or self.root.ids.country.text == "" or self.root.ids.priority.text == "":
            self.root.ids.status2.text = "All fields must be completed"
            return
        try:
            name = str(self.root.ids.name.text)
            country = str(self.root.ids.country.text)
            priority = int(self.root.ids.priority.text)
            visited = "y"

            self.placelist.add_to_list(name,country,priority,visited)
            temp_button = Button(
                text=self.generateDisplayText(name,country,priority,visited))
            temp_button.bind(on_release=self.press_entry)

            temp_button.background_color = self.getColor(visited)
            self.root.ids.entriesBox.add_widget(temp_button)


            self.root.ids.name.text = ""
            self.root.ids.country.text = ""
            self.root.ids.priority.text = ""

        except ValueError:
            self.message2 = "Please enter a valid year"

    def on_stop(self):

        '''Stop the program and save the changed data'''

        self.placelist.save_places()

if __name__ == '__main__':
    Travel().run()