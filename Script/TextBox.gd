extends CanvasLayer


onready var TextOutput := get_node("MarginContainer/Panel/TextOutput")

func set_text_to_textbox(txt_string: String):
	TextOutput.text = txt_string

func define_speed_for_one_symbol(cps: int):
	return 1.0/cps

func clear_textbox():
	TextOutput.text = ""
