extends KinematicBody

var gravity = -9.8
var target
var velocity = Vector3()
var speed = 150
var health = 100

const bulletScene = preload("res://EnemyBullet.tscn")
onready var healthBar = $HealthBar3D

func _ready():
	pass # Replace with function body.

func _process(delta):
	healthBar.update(health, 100)
	if(health < 1):
		queue_free()

func _physics_process(delta):
	findTarget()
	aim()
	velocity = Vector3()
	velocity += -transform.basis.x * speed * delta
	velocity += -transform.basis.z * speed * delta /10
	velocity.y += gravity * delta 
	move_and_slide(velocity, Vector3.UP)

func findTarget():
	var heroGroup = get_tree().get_nodes_in_group("Hero")
	target = heroGroup[0]

func aim():
	var ref = weakref(target)
	if(ref.get_ref()):
		var desired_rotation = transform.looking_at(target.transform.origin, Vector3(0,1,0))
		var quat = Quat(transform.basis.get_rotation_quat()).slerp(desired_rotation.basis.get_rotation_quat(), 1)
		set_transform(Transform(quat, transform.origin))

func shoot():
	var bullet = bulletScene.instance()
	bullet.setLoc($gunContainer.global_transform)
	get_parent().add_child(bullet)

func _on_Timer_timeout():
	shoot()

func got_shot(value):
	health -= value
