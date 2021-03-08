extends Area2D


# Exported variables(easy to change in editor) (Dont change in script)
export var YActivationSize = 200
export var XActivationSize = 200
export var labor = 50
export var foodProduction = 100

var active = false
var city

# Called when the node enters the scene tree for the first time.
func _ready():
	city = get_parent()

func nextTurn():
	if active:
		city.food = city.food + foodProduction


func _on_Field_input_event(viewport, event, shape_idx):
	if not active:
		if (event is InputEventMouseButton && event.pressed):
			active = true
			city.labor = city.labor + labor
			get_node("field/field_plant").visible = true
			var buildings = get_tree().get_nodes_in_group("Buildings")
			for building in buildings:
				#check that building is located within activation area
				if((self.position.y - YActivationSize < building.position.y && building.position.y < self.position.y + YActivationSize) && (self.position.x - XActivationSize < building.position.x && building.position.x < self.position.x + XActivationSize)):
					building.activate()
