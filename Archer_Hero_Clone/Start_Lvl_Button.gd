extends Button



# Called when the node enters the scene tree for the first time.
func _ready():
	pass




func _on_Start_Lvl_Button_pressed():
		$"/root/Global".round_number = 0

		get_tree().change_scene("res://Testing_Scene.tscn")
		
	
	
	
