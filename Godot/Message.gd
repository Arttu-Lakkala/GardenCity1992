extends Control


var parent 

func _ready():
	parent = get_parent()

func set_popup(content_text):
		$Content.set_text(content_text)


func _on_Button_pressed():
	parent.closeMessage()
