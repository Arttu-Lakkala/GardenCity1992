extends Area2D


# Exported variables(easy to change in editor) (Dont change in script)
export var YActivationSize = 200
export var XActivationSize = 200


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Field_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		var buildings = get_tree().get_nodes_in_group("Buildings")
		for building in buildings:
			#check that building is located within activation area
			if((self.position.y - YActivationSize < building.position.y && building.position.y < self.position.y + YActivationSize) && (self.position.x - XActivationSize < building.position.x && building.position.x < self.position.x + XActivationSize)):
				building.activate()
