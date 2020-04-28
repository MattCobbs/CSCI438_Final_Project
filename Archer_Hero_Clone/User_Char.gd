extends KinematicBody

var velocity = Vector3(0,0,0)
var speed = 4

#Main stats for character
#   Will probably need to change these to variables that get the loaded values from the save data
var total_coins = 10

var level = 1
var experience = 0
var experience_total = 0
var exp_to_next_lvl = calculate_required_exp( level + 1 )

var health = 100
var attack = 1

#Values from individual gameplay
var coins_collected = 0
var experience_collected = 10

 
#func _ready():


func _physics_process(delta):
	velocity.x = 0
	velocity.z = 0
	if Input.is_action_pressed("ui_up") && Input.is_action_pressed("ui_left"):
		velocity.z -= speed/2
		velocity.x -= speed/2 
	if Input.is_action_pressed("ui_up") && Input.is_action_pressed("ui_right"):
		velocity.z -= speed/2
		velocity.x += speed/2 	
	if Input.is_action_pressed("ui_down") && Input.is_action_pressed("ui_left"):
		velocity.z += speed/2
		velocity.x -= speed/2 
	if Input.is_action_pressed("ui_down") && Input.is_action_pressed("ui_right"):
		velocity.z += speed/2
		velocity.x += speed /2	
		
	if Input.is_action_pressed("ui_up"):
		velocity.z -= speed 
	if Input.is_action_pressed("ui_down"):
		velocity.z += speed 
	if Input.is_action_pressed("ui_right"):
		velocity.x += speed 
	if Input.is_action_pressed("ui_left"):
		velocity.x -= speed 

	move_and_slide(velocity)
	

func calculate_required_exp(level):
	return pow(level, 1.8) + level * 4

func gain_experience( amount ):
	experience_total += amount
	experience += amount
	if experience >= exp_to_next_lvl:
		experience -= exp_to_next_lvl
		level_up()
	

func level_up():
	level += 1
	exp_to_next_lvl = calculate_required_exp( level + 1 )
	
	attack += pow( attack, 1.2 )
	health += pow( health, 1.1 )


func _on_Checkpoint_body_entered(body):
	if body.name == "User_Char":
		get_tree().change_scene("res://Testing_Scene.tscn")


func _on_Coin_body_entered(body):
	if body.name == "User_Char":
		get_tree().change_scene("res://Testing_Scene.tscn")
