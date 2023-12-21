extends Node

func _on_door_to_hallwat_body_entered(body):
	#var hallway = "res://scenes/hallway.tscn"
	#get_tree().change_scene_to_file(hallway)
	SceneManager.switch_scene("res://scenes/hallway.tscn")
