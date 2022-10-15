extends CanvasLayer

onready var TextOutput := get_node("MarginContainer/Panel/TextOutput")

func get_text_to_textbox(txt_string: String):
	TextOutput.text = txt_string
