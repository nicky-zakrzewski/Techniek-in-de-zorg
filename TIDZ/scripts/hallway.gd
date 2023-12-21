extends Node

func _on_door_1_body_entered(body):
	#var room1 = "res://scenes/kamer.tscn"
	#get_tree().change_scene_to_file(room1)
	SceneManager.switch_scene("res://scenes/kamer.tscn")
