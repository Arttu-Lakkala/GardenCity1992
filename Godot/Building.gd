extends Area2D

#normal variables
export var industryProduction = 10
export var foodProduction = 25
export var grandmasHouse = false
export var coolHouse = false
export var oldManHouse = false
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
	#activate field
	active = true
	$building.modulate = Color8(255,255,255)
	
	#send assosiated message
	if grandmasHouse:
		city.UI.message(2,4)
	elif coolHouse:
		city.UI.message(3,8)
	elif oldManHouse:
		city.UI.message(4,9)
	else:
		if city.fieldsActivated ==0:
			city.UI.message(1,5)
		elif city.fieldsActivated ==1:
			city.UI.message(1,6)
		elif city.fieldsActivated ==2:
			city.UI.message(1,7)
		#count activated fields
		city.fieldsActivated = city.fieldsActivated +1
	
	
#function for clicking on this object
func _on_Building_input_event(viewport, event, shape_idx):
	
	if active && state == 1:
		if (event is InputEventMouseButton && event.pressed):
			if (city.industry >= 20 && not underConstruction):
				#activate building
				city.industry = city.industry - 20
				get_node("building/Construction").visible = true
				underConstruction = true
				$ConstructionSound.play()
				state = 0
				
					#send assosiated message
				if grandmasHouse:
					city.UI.message(2,10)
				elif coolHouse:
					city.UI.message(1,14, "Message From W.B:")
				elif oldManHouse:
					city.UI.message(4,15)
				else:
					if city.buildingsActivated ==0:
						city.UI.message(1,11)
					elif city.buildingsActivated ==1:
						city.UI.message(1,12)
					elif city.buildingsActivated ==2:
						city.UI.message(1,13)
					#count activated buildings
					city.buildingsActivated = city.buildingsActivated +1
	



#func _on_Building5_mouse_entered():
	#if active && state ==1:
		#city.displayTooltip("Building", "Spend 20 material to get some food production")


#func _on_Building_mouse_exited():
	#city.hideTooltip()
