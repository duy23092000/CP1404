class Place:
    def __init__(self, name="", country="", priority=0, visited=""):
        self.name = name
        self.country = country
        self.priority = priority
        self.visited = visited

    def __str__(self):
        if self.visited == "n":
            visited = "learned"
            return ("You have visited {} by {} ({})".format(self.name,self.country, self.priority))
        else:
            visited = "v"
            return ("You have not visited {} by {} ({})".format(self.name,self.country, self.priority))

    def mark_visited(self):

        ''' Change the status of the place to learn by click it'''

        #Mark the place visited
        self.visited = 'v'
        return self.visited

    def mark_unvisited(self):

        ''' Change the status of the place to learn by click it'''

        #Mark the place visited
        self.visited = 'n'
        return self.visited