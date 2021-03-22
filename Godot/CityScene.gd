extends Node2D

export var food = 500
export var food_production = 0
export var industry = 0
export var labor = 0
export var population = 0
export var consumption = 50


var turn = 1
var messageVisable = false

onready var UI = get_node("UnZoomCamera/UI")
#initalization

func _ready():
	$BackgroundAudio.play()
	


#what happens when player passes turn
func nextTurn():
	turn = turn + 1
	if turn == 5:
		UI.message("Turn 5")
	for child in get_children():
		#checks all children for a method named nextTurn
		#if it is found we exectude that method
		$TimePassSound.play()
		if child.has_method("nextTurn"):
			child.nextTurn()
	#add food
	food = food + food_production - consumption
	#if not enough food reduce solidarity
	
	if food <0:
		UI.message("GAME OVER")
		
	
	


#Normal process of the game this is where we check for key presses etc.
func _process(delta):
	if not messageVisable:
		if Input.is_action_just_pressed("next_turn"):
			if food <0:
				get_tree().reload_current_scene()
			nextTurn()
	else:
		if Input.is_action_just_pressed("close_message"):
			UI.closeMessage()

func displayTooltip(Tilte, content):
	$Tooltip.set_position(get_viewport().get_mouse_position())
	$Tooltip.tooltipMessage(Tilte, content)
	$Tooltip.visible = true

func hideTooltip():
	$Tooltip.visible = false
