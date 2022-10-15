extends Node2D

signal EOF_reached

func load_file(file_obj: Object):
	var full_string: String
	if file_obj.get_position() < file_obj.get_len():
		full_string = full_string + file_obj.get_line() + "\n"
	if len(full_string) == 0:
		emit_signal("EOF_reached")
	return full_string
