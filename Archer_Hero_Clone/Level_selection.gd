extends Button

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	set_text("[u]asdf[/] [img]res://Resources/intro_lvl.png[/img]")

func set_test(text):
	get_node("RichTextLabel").set_bbcode(text)
