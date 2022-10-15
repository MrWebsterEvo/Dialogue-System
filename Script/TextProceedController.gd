extends Node2D

onready var Reader := get_node("../FileReader")
onready var Output := get_node("../TextBox")
onready var Parent := get_node("..")

var file_name: Object

func _ready():
	file_name = Parent.file_obj

func _input(event):
	if event.is_action_pressed("act_LMB"):
		var text_string: String
		text_string = Reader.load_file(file_name)
		Output.get_text_to_textbox(text_string)
