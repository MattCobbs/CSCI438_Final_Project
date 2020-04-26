extends Area


func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	rotate_y(0.07)
	
#Will need a function that attracts all coins once all enemies are defeated
#  Could also just make the player pick them up through collision