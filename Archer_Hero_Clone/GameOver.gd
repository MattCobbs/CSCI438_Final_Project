extends Spatial


var timer


# Called when the node enters the scene tree for the first time.
func _ready():
	timer = get_node("Timer")
	timer.set_wait_time( 2 )
	timer.connect("Timeout", self, "on_Timer_timeout")
	timer.start()




func _on_Timer_timeout():
	get_tree().change_scene("res://Game_Menu.tscn")
