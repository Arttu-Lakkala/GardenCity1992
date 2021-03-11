extends WindowDialog

var content
var title


# Called when the node enters the scene tree for the first time.
func _ready():
	content = get_node("MarginContainer/Content")
	title = get_node("MarginContainer/VBoxContainer/Title")
	print(content)
	print(title)

func set_popup(title_text, content_text):
		title.set_text(title_text)
		content.set_text(content_text)
