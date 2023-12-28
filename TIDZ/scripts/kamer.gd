extends Node

signal scene_changed(next_scene_path)

func _on_door_to_hallwat_body_entered(body):
	scene_changed.emit("res://scenes/hallway.tscn")
