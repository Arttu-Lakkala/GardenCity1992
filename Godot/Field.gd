extends Area2D


#Exported variables(easy to change) (Dont change in script)
export var startingIndustryProduction = 50
export var startingFoodProduction = 0



#normal variables
var foodProduction = startingFoodProduction
var industryProduction = startingIndustryProduction 
var underConstruction = false
var state = 1
var makeInto = 2
var city


# Called when the node enters the scene tree for the first time.
# initalize variables
func _ready():
	city = get_parent()
	print(city)

#what to do when turn changes
func nextTurn():
	city.food = city.food + foodProduction
	city.industry = city.industry + industryProduction
	if underConstruction:
		state = makeInto
		if state == 1:
			get_node("building/plant").visible = false
			industryProduction = 50
			makeInto = 2
		if state == 2:
			get_node("building/plant").visible = true
			foodProduction = 50
			industryProduction = 50
			makeInto = 1
		
		$ReadySound.play()
		get_node("building/Construction").visible = false
		underConstruction = false
	
#function for clicking on this object
func _on_Field_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		if (city.industry >= 100 && not underConstruction):
			#add more construction options here
			city.industry = city.industry - 100
			industryProduction = 0
			foodProduction = 0
			get_node("building/Construction").visible = true
			underConstruction = true
			$ConstructionSound.play()
			state = 0
