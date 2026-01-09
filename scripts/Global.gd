extends Node

signal score_changed(new_score)
signal gravity_flipped(is_gravity_down)

var score: int = 0:
	set(value):
		score = value
		score_changed.emit(score)

var is_gravity_down: bool = true

func add_score(amount: int):
	score += amount

func reset_score():
	score = 0
