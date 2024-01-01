extends Control

@onready var hallway = $".."
@onready var SceneManager = $"/root/SceneManager"

signal scene_changed(next_scene_path)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_resume_pressed():
	SceneManager.pauseMenu()


func _on_help_pressed():
	pass # Replace with function body.


func _on_main_menu_pressed():
	scene_changed.emit("res://scenes/main_menu.tscn")
	SceneManager.pauseMenu()
