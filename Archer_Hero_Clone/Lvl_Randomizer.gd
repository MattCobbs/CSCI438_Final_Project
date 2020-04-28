extends Spatial


func _ready():
	$"/root/Global".round_number += 1
	
	if $"/root/Global".round_number == 6:
		get_tree().change_scene("res://Winner.tscn")
	#seed the random number generator
	randomize()
	var num_mods = $Base_Floor.get_child_count()
	var rand_num = randi()%num_mods
	#hide all mods
	for i in $Base_Floor.get_children():
		if i.get_index() != rand_num:
			i.visible = not i.visible
			i.set_collision_layer_bit(0, false)
			i.set_collision_mask_bit(0, false)
