extends Control


var parent 
var content
var sender

func _ready():
	parent = get_parent()

func set_popup(messageType, content_text, sender = "Office"):
	#visualize correct message form
	$browser.visible = false
	$grandma.visible = false
	if messageType == 1:
		content = get_node("browser/BrowserContent")
		$browser.visible = true
	elif messageType == 2:
		content = get_node("grandma/GrandmaContent")
		$grandma.visible = true
	else: pass
	#set correct message text
	content.text = content_text


func _on_Button_pressed():
	parent.closeMessage()
