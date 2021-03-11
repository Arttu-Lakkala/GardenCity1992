extends Node2D

export var food = 0
export var food_production = 0
export var industry = 0
export var labor = 0
export var population = 0
export var solidarity = 75

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
	#add food
	food = food + food_production
	#if not enough food reduce solidarity
	if food < population:
		solidarity = solidarity - (population - food)
		food = 0
	else:
		food = food - population
	
	labor = population/10
	
	if solidarity <=0:
		$UI.message("GAME OVER", "You lost the game")
		
	
	


#Normal process of the game this is where we check for key presses etc.
func _process(delta):
	if Input.is_action_just_pressed("next_turn"):
		if solidarity <=0:
			get_tree().reload_current_scene()
		nextTurn()
