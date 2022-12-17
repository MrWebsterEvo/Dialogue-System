extends Node2D

onready var Output := get_node("../TextBox")
onready var Parent := get_node("..")
onready var character_per_second = GlobalParamList.CPS

enum {
	IDLE,
	ADVANCE,
	FAST_FORWARD
}

onready var STATE := IDLE

var dialogue_node: Node
var text_string: String
var line_id: int

func _ready():
	dialogue_node = Parent.get_dialogue_node()


func _input(event):
	if event.is_action_pressed("act_LMB"):
		if not text_string:
			text_string = load_file()
		if text_string and STATE == IDLE:
			STATE = ADVANCE
			start_typing()
		elif text_string and STATE == ADVANCE:
			STATE = FAST_FORWARD

func load_file():
	var container
	var full_string := ['','']
	
	if not line_id:
		container = dialogue_node.dialogue_container[1]
		line_id = container[2]
		full_string[1] = container[1]
	else:
		container = dialogue_node.dialogue_container[line_id]
		full_string[1] = container[1]
		line_id = container[2]
	
	return full_string[1]

func return_to_idle_state():
	text_string = ''
	STATE = IDLE

func define_speed_for_one_symbol(cps: int):
	return 1.0/cps

func start_typing():
	var container := ''
	var speed: float
	speed = define_speed_for_one_symbol(character_per_second)
	if STATE:
		for symbol in text_string:
			match STATE:
				ADVANCE:
					yield(get_tree().create_timer(speed), "timeout")
					container += symbol
					Output.set_text_to_textbox(container)
				FAST_FORWARD:
					Output.set_text_to_textbox(text_string)
					break
		return_to_idle_state()
	
