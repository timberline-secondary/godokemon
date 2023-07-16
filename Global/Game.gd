extends Node

func _ready():
	print(selectedDokimons)
	addDokimon("Pikmon")
	addExp(1000)
	print(selectedDokimons)

var databaseDokimons = {
	0 : {
		"Name": "Pikmon",
		"Frame": 0,
		"Health": 100,
		"Level": 1,
		"Exp": 0,
		"MaxExp": 10,
		"Strength": 10,
		"Defense": 5,
		"Scene": preload("res://icon.png"),
		"Attacks": {
			0: {
				"Name": "Blast",
				"Target": "Monster",
				"Damage": 10,
				"Cost": 2
				},
			1: {
				"Name": "Whack",
				"Target": "Monster",
				"Damage": 100,
				"Cost": 10
			}
		}
	},
	1 : {
		"Name": "Pokmon",
		"Frame": 0,
		"Health": 100,
		"Level": 1,
		"Exp": 0,
		"MaxExp": 10,
		"Strength": 10,
		"Defense": 5,
		"Scene": preload("res://icon.png"),
		"Attacks": {
			0: {
				"Name": "CHICKEM",
				"Target": "Monster",
				"Damage": 10,
				"Cost": 2
				},
			1: {
				"Name": "Whack",
				"Target": "Monster",
				"Damage": 100,
				"Cost": 10
			}
		}
	}
}

var selectedDokimons = {
	
}

func addDokimon(name):
	# Loop through the dictionary's values, which are the dokimon
	# This allows us to access each dokimon dictionary directory without
	# worrying about the keys and simplifies our code
	for dokimon in databaseDokimons.values():
		# Since we are accessing the dokimon dictionary directly, each time through the loop
		# the `dokimon` loop variabe will hold a different dokimon.
		
		if dokimon["Name"] == name:
			# `duplicate() will create a copy of the dokimon, so that when we change it's Health
			# Exp and other variables, it won't also change the original record in `databaseDokimons` 
			# The `true` tells the duplicate method to also copy any other nested dictionaries,
			# such as the "Attacks" dictionary that each dokimon has.
			
			# `size()` will get how many entries there are in the dictionary.
			# for example, if selectedDokimons already has two entrys, they will have keys 0, and 1, and
			# selectedDokimons.size() will be 2, which conveniently is what the next key should be if
			# we want to insert a new entry
			selectedDokimons[selectedDokimons.size()] = dokimon.duplicate(true)
			
	# Note: if we wanted to make the code even cleaner, we can access the dokimon's dictionary keys
	# using "dot" notation like this:
	# if dokimon.Name -- name:

func addExp(amount):
	# Loop through the dokimon by accessing the values directly
	for dokimon in selectedDokimons.values():
		# I'm going to use "dot" notation to access the dokimon's dictionary keys
		# because it's cleaner looking! (instead of `dokimon["Exp"] += amount`)
		dokimon.Exp += amount
		
		if dokimon.Exp >= dokimon.MaxExp:
			
			# level up
			dokimon.Level += 1
			dokimon.Exp = 0
			# Similar to += we can use *= as a shortcut
			dokimon.MaxExp *= 1.5
			
	
