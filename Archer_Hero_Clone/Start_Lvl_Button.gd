extends Button



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.




func _on_Start_Lvl_Button_pressed():
	#load which ever level is currently selected in the menu
		#Will need to define a variable that gets assigned the path to the currently selected level
		
		# Hard coded to the intro level for now
		get_tree().change_scene("res://Testing_Scene.tscn")
		
	
	
	
