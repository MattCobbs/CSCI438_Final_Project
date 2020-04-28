extends Area

var speed = 10
var velocity = Vector3()
var damage = 10


func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	transform.origin += (-transform.basis.z * speed * delta)

func setLoc(location):
	transform = location

func _on_EnemyBullet_body_entered(body):
	if body.is_in_group('Hero'):
		body.got_shot(damage)
		queue_free()
	if not body.is_in_group('Enemy'):
		queue_free()
