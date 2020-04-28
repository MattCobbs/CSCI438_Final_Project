extends TextureProgress

var bar_red = preload("res://Resources/Images/barHorizontal_red.png")
var bar_green = preload("res://Resources/Images/barHorizontal_green.png")
var bar_yellow = preload("res://Resources/Images/barHorizontal_yellow.png")

func _ready():
	pass

func update_healthbar(health, full):
	texture_progress = bar_green
	if health < full * 0.7:
		texture_progress = bar_yellow
	if health < full * 0.35:
		texture_progress = bar_red
	if health < full:
		show()
	self.value = health
