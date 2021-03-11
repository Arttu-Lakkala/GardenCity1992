extends Control


# Declare member variables here. Examples:
# var a = 2
var parent


# Called when the node enters the scene tree for the first time.
func _ready():
	parent = get_parent()

#what happens when player passes turn
func _process(delta):
	$Solidarity.text = ("Solidarity: "+ str(parent.solidarity))
	$Surplus.text = ("Food surplus: "+ str(parent.food))
	$Food_Production.text = ("Food production: "+ str(parent.food_production))
	$Material_Production.text = ("Material: "+ str(parent.industry))
	$Date_Count.text = (str(parent.turn))
	$Workers.text = ("Workers: " + str(parent.labor))
	$Population.text = ("Population: " + str(parent.population))
	

func message(title, content):
	$Message.set_popup(title, content)
	$Message.popup_centered()
