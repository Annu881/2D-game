extends Area2D

@export var next_level_path: String = "res://scenes/MainMenu.tscn"

func _on_body_entered(body):
	if body.name == "Player":
		call_deferred("change_level")

func change_level():
	if next_level_path:
		get_tree().change_scene_to_file(next_level_path)
