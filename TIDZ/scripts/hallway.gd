extends Node

signal scene_changed(next_scene_path)


func _on_door_1_body_entered(body):
	scene_changed.emit("res://scenes/kamer.tscn")
