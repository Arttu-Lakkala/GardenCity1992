extends Control


# Declare member variables here. Examples:
# var a = 2
var parent
var TimePassingTimer = 0.0


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
	
	if(TimePassingTimer):
		
		TimePassingTimer -= delta
		
		if TimePassingTimer < 0:
			get_node("TurnPass/Sun").visible = false
			$TurnPass.stop()
			TimePassingTimer = 0.0
			if not parent.messageVisable:
				$Dimmer.visible = false
	

func message(content, type):
	#set message
	$Message.set_popup(content, type)
	#make it visable
	$Message.visible = true
	$Dimmer.visible = true
	#notify main scene
	parent.messageVisable = true

func closeMessage():
	#close message
	$Message.visible = false
	$Dimmer.visible = false
	#notify main scene
	parent.messageVisable = false


func nextTurn():
	get_node("TurnPass/Sun").visible = true
	$TurnPass.play("TurnPass")
	$Dimmer.visible = true
	TimePassingTimer = 2.0
