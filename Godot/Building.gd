extends Area2D

#normal variables
export var industryProduction = 10
export var foodProduction = 25
export var grandmasHouse = false
var underConstruction = false
var state = 1
var makeInto = 2
var city
var active = false;


# Called when the node enters the scene tree for the first time.
# initalize variables
func _ready():
	city = get_parent()

#what to do when turn changes
func nextTurn():
	if active:
		city.industry = city.industry + industryProduction
		if underConstruction:
			state = makeInto
			if state == 1:
				get_node("building/plant").visible = false
				city.food_production = city.food_production - foodProduction
				makeInto = 2
			if state == 2:
				get_node("building/plant").visible = true
				city.food_production = city.food_production + foodProduction
				city.labor = city.labor + 1
				makeInto = 1
			
			$ReadySound.play()
			get_node("building/Construction").visible = false
			underConstruction = false

#happens when building gets activated
func activate():
	if grandmasHouse:
		city.UI.message(2,4)
	active = true
	$building.modulate = Color8(255,255,255)
	
#function for clicking on this object
func _on_Building_input_event(viewport, event, shape_idx):
	if active && state == 1:
		if (event is InputEventMouseButton && event.pressed):
			if (city.industry >= 20 && not underConstruction):
				#add more construction options here
				city.industry = city.industry - 100
				industryProduction = 0
				get_node("building/Construction").visible = true
				underConstruction = true
				$ConstructionSound.play()
				state = 0


func _on_Building5_mouse_entered():
	if active && state ==1:
		city.displayTooltip("Building", "Spend 20 material to get some food production")


func _on_Building_mouse_exited():
	city.hideTooltip()
