extends Control

const CROSSHAIR : CompressedTexture2D = preload("res://Textures/Win95PlusBlack.png")
const MOUSE : CompressedTexture2D = preload("res://Textures/Win95TriBlack.png")
const CROSSHAIR_OFFSET : Vector2 = Vector2(12, 12)
const MOUSE_OFFSET : Vector2 = Vector2(0, 0)


# Called when the node enters the scene tree for the first time.
func _ready():
	DisplayServer.cursor_set_custom_image(MOUSE, DisplayServer.CURSOR_ARROW, MOUSE_OFFSET)
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	SceneManager.switch_scene("res://scenes/tasks/task_list.tscn")


func _on_quit_pressed():
	get_tree().quit()
