extends Area2D

#normal variables
export var industryProduction = 5
export var foodProduction = 10
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
				industryProduction = 5
				makeInto = 2
			if state == 2:
				get_node("building/plant").visible = true
				city.food_production = city.food_production + foodProduction
				industryProduction = 5
				makeInto = 1
			
			$ReadySound.play()
			get_node("building/Construction").visible = false
			underConstruction = false

#happens when building gets activated
func activate():
	active = true
	get_node("building/Construction").visible = true
	
#function for clicking on this object
func _on_Building_input_event(viewport, event, shape_idx):
	if active:
		if (event is InputEventMouseButton && event.pressed):
			if (city.industry >= 100 && not underConstruction):
				#add more construction options here
				city.industry = city.industry - 100
				industryProduction = 0
				get_node("building/Construction").visible = true
				underConstruction = true
				$ConstructionSound.play()
				state = 0
