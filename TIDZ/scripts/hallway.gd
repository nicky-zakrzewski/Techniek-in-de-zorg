extends Node

@onready var pause_menu = $PauseMenu

var paused = false

func _on_door_1_body_entered(body):
	#var room1 = "res://scenes/kamer.tscn"
	#get_tree().change_scene_to_file(room1)
	SceneManager.switch_scene("res://scenes/kamer.tscn")
	
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		pauseMenu()
func pauseMenu():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
	paused = !paused
	
