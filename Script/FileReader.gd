extends Node2D

signal EOF_reached

onready var Interpreter := get_node("Interpreter")

func load_file(file_obj: Object):
	var raw_string: String
	var full_string := ['','']
	if file_obj.get_position() < file_obj.get_len():
		raw_string = raw_string + file_obj.get_line()
	if len(raw_string) == 0:
		emit_signal("EOF_reached")
	
	full_string = Interpreter.read_line(raw_string)
	
	print('String ' + str(full_string[0]))
	print('Type ' + str(full_string[1]))
	
	return full_string[0]
