extends Area


func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	rotate_y(0.05)
	


func _on_End_level_body_entered(body):
	if body.is_in_group('Hero'):
		get_tree().change_scene("res://Testing_Scene.tscn")		
