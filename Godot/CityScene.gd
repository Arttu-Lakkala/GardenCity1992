extends Node2D

export var food = 4000
export var food_production = 0
export var industry = 0
export var labor = 5
export var population = 0
export var consumption = 300

var warnings = 0
var successes = 0
var buildingsActivated = 0
var fieldsActivated = 0
var turn = 1
var messageVisable = true
var timePassingTimer = 0

onready var UI = get_node("UnZoomCamera/UI")
#initalization

func _ready():
	$BackgroundAudio.play()
	


#what happens when player passes turn
func nextTurn():
	
	timePassingTimer = 2.0
	
	turn = turn + 1
	labor = labor + 1
	for child in get_children():
		#checks all children for a method named nextTurn
		#if it is found we exectude that method
		UI.nextTurn()
		$TimePassSound.play()
		if child.has_method("nextTurn"):
			child.nextTurn()
	#reduce food
	food = food + food_production - consumption
	
	#warning messages
	if(food_production<101 && food<2500 && warnings<1):
		UI.message(1, 17)
		warnings=1
	if(food_production<150 && food<1500 && warnings<2):
		UI.message(1, 18)
		warnings=2
	if(food_production<200 && food<1500 && warnings<3):
		UI.message(1, 19)
		warnings=3
	if(food + food_production<=consumption):
		UI.message(1, 20)
	
	if(food_production>200 && successes<1):
		successes = 1
		UI.message(1, 25)
	
	if(food_production>250 && successes<2):
		successes = 2
		UI.message(1, 26)
	

#Normal process of the game this is where we check for key presses etc.
func _process(delta):
	if timePassingTimer > 0:
		
		timePassingTimer -= delta
		
		if timePassingTimer < 0:
			timePassingTimer = 0
			
	if not messageVisable && timePassingTimer == 0:
		if Input.is_action_just_pressed("next_turn"):
			if food <=0:
				get_tree().change_scene("res://Lose_Scene.tscn")
			if food_production > consumption:
				get_tree().change_scene("res://Win_Scene.tscn")
			nextTurn()

#func displayTooltip(Tilte, content):
	#$Tooltip.tooltipMessage(Tilte, content)
	#$Tooltip.visible = true

#func hideTooltip():
	#$Tooltip.visible = false
