from place import Place
lists = []

infile = open("places.csv", 'r')
lines = infile.readlines()
for line in lines:
    place_item = line.split(',')
    place_item[3] = place_item[3].strip('\n')
    loaded_place = Place(place_item[0], place_item[1], place_item[2], place_item[3])
    lists.append(loaded_place)

print(lists[0])
infile.close()

