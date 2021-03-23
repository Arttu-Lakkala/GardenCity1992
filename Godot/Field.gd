extends Area2D


# Exported variables(easy to change in editor) (Dont change in script)
export var YActivationSize = 200
export var XActivationSize = 200
export var labor = 1
export var foodProduction = 50
export var startPopulation = 40
export var populationIncrement = 2
export var maxPopulation = 70

var active = false
var city

# Called when the node enters the scene tree for the first time.
func _ready():
	city = get_parent()

func nextTurn():
	if active:
		if startPopulation<maxPopulation:
			startPopulation = startPopulation + populationIncrement
			city.population = city.population + populationIncrement

func _on_Field_input_event(viewport, event, shape_idx):
	if not active:
		if (event is InputEventMouseButton && event.pressed):
			if city.labor >= 5:
				city.labor = city.labor - 5
				active = true
				city.population = city.population + startPopulation
				city.food_production = city.food_production + foodProduction
				get_node("field/field_plant").visible = true
				var buildings = get_tree().get_nodes_in_group("Buildings")
				for building in buildings:
					#check that building is located within activation area
					if((self.position.y - YActivationSize < building.position.y && building.position.y < self.position.y + YActivationSize) && (self.position.x - XActivationSize < building.position.x && building.position.x < self.position.x + XActivationSize)):
						building.activate()


func _on_Field_mouse_entered():
	if not active:
		city.displayTooltip("Field", "Work (5 labor) to meet nearby people")


func _on_Field_mouse_exited():
	pass # Replace with function body.
