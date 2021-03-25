extends Control

onready var filePath = 'res://Messages.dat'
var parent 
var content
var sender
var player
var tutorial = true

func _ready():
	parent = get_parent()
	

func set_popup(messageType, content_text_number, sender = "Message from the Citizen's Council:"):
	#visualize correct message form
	$browser.visible = false
	$grandma.visible = false
	$resident2.visible = false
	$mageman.visible = false
	if messageType == 1:
		player = $MessageAudio
		content = get_node("browser/BrowserContent")
		$browser.visible = true
		get_node("browser/BrowserSender").text = sender
	elif messageType == 2:
		player = $SpeachAudio
		content = get_node("grandma/GrandmaContent")
		$grandma.visible = true
	elif messageType == 3:
		player = $SpeachAudio
		content = get_node("resident2/ResidentContent")
		$resident2.visible = true
	elif messageType == 4:
		player = $SpeachAudio
		content = get_node("mageman/MAgeManCOntent")
		$mageman.visible = true
	else: pass
	#set correct message text
	content.text = load_from_file(content_text_number, filePath)
	if content_text_number ==1:
		content.text = (content.text + "\n\n" +load_from_file(2, filePath))
	
	#if turn isn't passing play sound
	if parent.TimePassingTimer == 0:
		player.play()


func _on_Button_pressed():
	parent.closeMessage()
	if tutorial:
		parent.message(1,1)
		tutorial = false

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
