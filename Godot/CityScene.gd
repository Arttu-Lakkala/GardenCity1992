extends Node2D

export var food = 0
export var industry = 0
export var labor = 0
export var population = 0
export var solidarity = 75
export var requierd_food = 200

var turn = 1
#initalization

func _ready():
 pass


#what happens when player passes turn
func nextTurn():
	turn = turn + 1
	for child in get_children():
		#checks all children for a method named nextTurn
		#if it is found we exectude that method
		$TimePassSound.play()
		if child.has_method("nextTurn"):
			child.nextTurn()
	
	if food < requierd_food:
		solidarity = solidarity - (population/10)
		food = 0
	else:
		food = food - requierd_food
	
	if solidarity <=0:
		get_tree().reload_current_scene()
		
	
	


#Normal process of the game this is where we check for key presses etc.
func _process(delta):
	if Input.is_action_just_pressed("next_turn"):
		nextTurn()
