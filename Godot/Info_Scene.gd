extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _process(delta):
	if Input.is_action_just_pressed("next_turn"):
		get_tree().change_scene("res://CityScene.tscn")
