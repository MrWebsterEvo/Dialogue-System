extends Node2D
##########################
####### К удалению #######
##########################

enum {
	IDLE,
	ADVANCE
}

# onready var Interpreter := get_node("Interpreter")
onready var STATE := IDLE


func proceed_text(dialogue_node: Object):
	if STATE == IDLE:
		return load_file(dialogue_node)
	elif STATE == ADVANCE:
		pass

func load_file(dialogue_node: Object):
	var raw_string: String
	var cnt
	var full_string := ['','']
#	if dialogue_node.get_position() < dialogue_node.get_len():
#		raw_string = raw_string + dialogue_node.get_line()
#	if len(raw_string) == 0:
#		emit_signal("EOF_reached")
	
#	full_string = Interpreter.read_line(raw_string)
	cnt = dialogue_node.dialogue_container[1]
	full_string = cnt[1]
	
	
	return full_string[0]
