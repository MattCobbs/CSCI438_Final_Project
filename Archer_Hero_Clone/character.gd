extends KinematicBody

var gravity = -9.8
var velocity = Vector3()
var camera
var animation_player
var enemyToShoot
var enemies
var health = 100

const bulletScene = preload("res://HeroBullet.tscn")
onready var healthBar = $HealthBar3D
onready var timer = $Timer

const SPEED = 8
const ACCELARATION = 3
const DE_ACCELARATION = 5 

func _ready():
	camera = get_node("../Camera").get_global_transform()

func _process(delta):
	healthBar.update(health, 100)
	if(health < 1):
		queue_free()

func _physics_process(delta):
	var direction = Vector3()
	var is_moving = false
	
	if(Input.is_action_pressed("move_forward")):
		direction += -camera.basis[2]
		is_moving = true
	if(Input.is_action_pressed("move_backward")):
		direction += camera.basis[2]
		is_moving = true
	if(Input.is_action_pressed("move_left")):
		direction += -camera.basis[0]
		is_moving = true
	if(Input.is_action_pressed("move_right")):
		direction += camera.basis[0]
		is_moving = true
	
	direction.y = 0
	direction = direction.normalized()
	
	velocity.y += delta * gravity
	
	var hv = velocity
	hv.y = 0
	
	var new_pos = direction * SPEED
	var accel = DE_ACCELARATION
	
	if(direction.dot(hv) > 0):
		accel = ACCELARATION
		
	hv = hv.linear_interpolate(new_pos, accel * delta)
	
	velocity.x = hv.x
	velocity.z = hv.z
	
	velocity = move_and_slide(velocity, Vector3.UP)
	
	if is_moving:
		timer.stop()
		var angle = atan2(hv.x, hv.z)
		var character_rotation = get_rotation()
		character_rotation.y = angle
		set_rotation(character_rotation)
	else:
		if(timer.is_stopped()):
			findClosestEnemy()
			if(is_instance_valid(enemyToShoot)):
				aim()
				shoot()
				timer.start()

func calcDistance(enemy:KinematicBody):
	var distance = pow(enemy.transform.origin.x - transform.origin.x, 2) + pow(enemy.transform.origin.z - transform.origin.z, 2)
	distance = sqrt(distance)
	return distance

func findClosestEnemy():
	var minDistance = 1000
	var enemies = get_tree().get_nodes_in_group("Enemy")
	for item in enemies:
		var distance = calcDistance(item)
		if(distance < minDistance):
			enemyToShoot = item
			minDistance = distance

func aim():
	var ref = weakref(enemyToShoot)
	if(ref.get_ref()):
		var desired_rotation = transform.looking_at(enemyToShoot.transform.origin, Vector3(0,1,0))
		var quat = Quat(transform.basis.get_rotation_quat()).slerp(desired_rotation.basis.get_rotation_quat(), 1)
		set_transform(Transform(quat, transform.origin))

func shoot():
	var bullet = bulletScene.instance()
	bullet.setLoc($gunContainer.global_transform)
	get_parent().add_child(bullet)


func _on_Timer_timeout():
	findClosestEnemy()
	if(is_instance_valid(enemyToShoot)):
		aim()
		shoot()

func got_shot(value):
	health -= value
