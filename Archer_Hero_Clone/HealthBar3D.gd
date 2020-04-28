extends Sprite3D

onready var bar = get_node("../Viewport/HealthBar2D")

func _ready():
	pass

func update(value, full):
	bar.update_healthbar(value, full)
