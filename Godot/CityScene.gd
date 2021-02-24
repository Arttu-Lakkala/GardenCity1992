extends Node2D

#Exported variables(easy to change) (Dont change in script)
export var startingFood = 0
export var startingIndustry = 0
export var startingLabor = 0

#(Normal variables)
#list of numbers/others we need to keep track of

var food = startingFood
var industry = startingIndustry
var labor = startingLabor
#initalization
func _ready():
 pass


#what happens when player passes turn
func nextTurn():
	for child in get_children():
		#checks all children for a method named nextTurn
		#if it is found we exectude that method
		if child.has_method("nextTurn"):
			child.nextTurn()
	print("we have " + str(food) + " food")
	print("we have " + str(industry) + " industry")


#Normal process of the game this is where we check for key presses etc.
func _process(delta):
	if Input.is_action_just_pressed("next_turn"):
		nextTurn()
