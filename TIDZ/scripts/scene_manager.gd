extends Node

@onready var current_scene = $MainMenu
@onready var pause_menu = $PauseMenu

var paused = false

func _ready():
	current_scene.scene_changed.connect(handle_scene_changed)
	
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		pauseMenu()

func handle_scene_changed(next_scene_path: String):
	$TransitionScreen.show()
	$TransitionScreen.transition()
	await $TransitionScreen.transitioned
	var next_scene

	next_scene = load(next_scene_path).instantiate()
			
	add_child(next_scene)
	next_scene.scene_changed.connect(handle_scene_changed)
	current_scene.queue_free()
	current_scene = next_scene
	$TransitionScreen.hide()

func pauseMenu():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
	paused = !paused
