extends Control

onready var filePath = 'res://Messages.txt'
var parent 
var content
var sender
var player

func _ready():
	parent = get_parent()
	

func set_popup(messageType, content_text_number, sender = "Office"):
	#visualize correct message form
	$browser.visible = false
	$grandma.visible = false
	if messageType == 1:
		player = $MessageAudio
		content = get_node("browser/BrowserContent")
		$browser.visible = true
	elif messageType == 2:
		player = $SpeachAudio
		content = get_node("grandma/GrandmaContent")
		$grandma.visible = true
	else: pass
	#set correct message text
	content.text = load_from_file(content_text_number, filePath)
	
	#if turn isn't passing play sound
	if parent.TimePassingTimer == 0:
		player.play()


func _on_Button_pressed():
	parent.closeMessage()

func load_from_file(number, path):
	var file = File.new()
	file.open(path, File.READ)
	var found = "no line found"
	var index = 1
	while not file.eof_reached(): 
		var line = file.get_line()
		if index == number:
			found = line
			break
		index = index +1
		
	file.close()
	return found
