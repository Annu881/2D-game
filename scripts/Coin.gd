extends Area2D

func _on_body_entered(body):
	if body.name == "Player":
		Global.add_score(10)
		queue_free()
