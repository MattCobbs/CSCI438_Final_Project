extends Area

var speed = 35
var velocity = Vector3()
var damage = 25


func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	transform.origin += (-transform.basis.z * speed * delta)

func setLoc(location):
	transform = location

func _on_HeroBullet_body_entered(body):
	if body.is_in_group('Enemy'):
		body.got_shot(damage)
		queue_free()
	if not body.is_in_group('Hero'):
		queue_free()
