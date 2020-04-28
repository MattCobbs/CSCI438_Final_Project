extends Spatial

var time = 0
const PLAY_TIME = .5
var play_time = 0
var timer
var stopper
var next_scene
var audio = AudioStreamPlayer.new()

func _ready():
	self.add_child(audio)
	audio.stream = load("res://Resources/Audio/Corona.ogg")
	timer = get_node("Timer")
	stopper = get_node("Stopper")
	next_scene = get_node("Next_Scene")
	
	timer.set_wait_time( 1 )
	stopper.set_wait_time( 1.75 )
	next_scene.set_wait_time( 1 )
	
	timer.connect("Timeout", self, "on_Timer_timeout")
	stopper.connect("Stoptime", self, "on_Timer_timeout")
	next_scene.connect("NS_Time",self, "on_Timer_timeout")
	timer.start()

func _on_Timer_timeout():
	timer.stop()
	audio.play()
	stopper.start()

func _on_Stopper_timeout():
	stopper.stop()
	audio.stop()
	next_scene.start()

func _on_Next_Scene_timeout():
	get_tree().change_scene("res://Game_Menu.tscn")
	
