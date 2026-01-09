extends CanvasLayer

@onready var score_label = $Control/ScoreLabel
@onready var gravity_label = $Control/GravityLabel

func _ready():
	Global.score_changed.connect(_on_score_changed)
	Global.gravity_flipped.connect(_on_gravity_flipped)
	update_score_text(Global.score)
	update_gravity_text(Global.is_gravity_down)

func _on_score_changed(new_score):
	update_score_text(new_score)

func _on_gravity_flipped(is_down):
	update_gravity_text(is_down)

func update_score_text(score):
	score_label.text = "Score: " + str(score)

func update_gravity_text(is_down):
	if is_down:
		gravity_label.text = "Gravity: DOWN"
		gravity_label.modulate = Color(0, 1, 1) # Cyan
	else:
		gravity_label.text = "Gravity: UP"
		gravity_label.modulate = Color(1, 0, 1) # Magenta
