extends Control


# Declare member variables here. Examples:
# var a = 2
var parent


# Called when the node enters the scene tree for the first time.
func _ready():
	parent = get_parent().get_parent()

#what happens when player passes turn
func _process(delta):
	$Solidarity.text = ("Solidarity (UNUSED)")
	$Surplus.text = ("Food surplus: "+ str(parent.food))
	$Food_Production.text = ("Food loss: "+ str(parent.food_production - parent.consumption))
	$Material_Production.text = ("Material: "+ str(parent.industry))
	$Date_Count.text = (str(parent.turn))
	$Workers.text = ("Workers: " + str(parent.labor))
	$Population.text = ("Support " + str(parent.population))
	

func message(content):
	$Message.set_popup(content)
	$Message.visible = true
	parent.messageVisable = true

func closeMessage():
	$Message.visible = false
	parent.messageVisable = false
