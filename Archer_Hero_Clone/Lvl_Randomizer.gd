extends Spatial

#var number_of_mods = 0
#number_of_mods = $Base_Floor.get_child_count()

#var mod_array = $Base_Floor.get_children()



func _ready():
	#seed the random number generator
	randomize()
	var num_mods = $Base_Floor.get_child_count()
	var rand_num = randi()%num_mods
	#hide all mods
	for i in $Base_Floor.get_children():
		if i.get_index() != rand_num:
			i.visible = not i.visible
	print(rand_num)
