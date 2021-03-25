extends Node2D

export var food = 4000
export var food_production = 0
export var industry = 0
export var labor = 5
export var population = 0
export var consumption = 200


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
	#add food
	food = food + food_production - consumption
	

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
