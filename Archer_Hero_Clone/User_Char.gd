extends KinematicBody

var velocity = Vector3(0,0,0)
var speed = 4

 
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
	