extends Area2D

func input_event(viewport, event, shap_idx):
	if event is InputEventMouseButton and event.buttun_index == BUTTON_LEFT and event.is_pressed():
		self.on_click()

func _ready():
	pass

func on_click():
	print("Clicked box")
