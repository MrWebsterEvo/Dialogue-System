extends Node2D

onready var Output := get_node("../TextBox")
onready var Parent := get_node("..")

enum {
	IDLE,
	ADVANCE
}

onready var STATE := IDLE

var dialogue_node: Node
var line_id: int

func _ready():
	dialogue_node = Parent.get_dialogue_node()
	Output.connect("finish_typing", self, "return_to_idle")

func _input(event):
	if event.is_action_pressed("act_LMB"):
		var text_string: String
		text_string = proceed_text()
		if text_string:
			Output.get_text_to_textbox(text_string)

func proceed_text():
	if STATE == IDLE:
		STATE = ADVANCE
		Output.clear_textbox()
		return load_file()
	elif STATE == ADVANCE:
		return ''

func load_file():
	var raw_string: String
	var cnt
	var full_string := ['','']
	
	cnt = dialogue_node.dialogue_container[1]
	full_string[0] = cnt[1]
	
	
	return full_string[0]

func return_to_idle():
	STATE = IDLE
