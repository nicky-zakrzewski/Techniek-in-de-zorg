extends Control

@onready var hallway = $".."

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_resume_pressed():
	hallway.pauseMenu()


func _on_help_pressed():
	pass # Replace with function body.


func _on_main_menu_pressed():
	hallway.pauseMenu()
	SceneManager.switch_scene("res://scenes/main_menu.tscn")
