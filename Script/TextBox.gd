extends CanvasLayer

signal finish_typing

onready var TextOutput := get_node("MarginContainer/Panel/TextOutput")
onready var character_per_second = GlobalParamList.CPS

func get_text_to_textbox(txt_string: String):
	var speed: float
	speed = define_speed_for_one_symbol(character_per_second)
	# TextOutput.text = txt_string
	for symbol in txt_string:
		yield(get_tree().create_timer(speed), "timeout")
		TextOutput.text += symbol
	emit_signal("finish_typing")

func define_speed_for_one_symbol(cps: int):
	return 1.0/cps

func clear_textbox():
	TextOutput.text = ""
