extends Control


# Declare member variables here. Examples:
# var a = 2
var parent


# Called when the node enters the scene tree for the first time.
func _ready():
	parent = get_parent()

#what happens when player passes turn
func _process(delta):
	$Food_Production.text = ("Food: "+ str(parent.food))
	$Material_Production.text = ("Material: "+ str(parent.industry))
	$Date_Count.text = (str(parent.turn))
