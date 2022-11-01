extends Node2D

const FILE_NAME := "res://Plot/SampleText.txt"
var file_obj = File.new()
onready var Reader := get_node("FileReader")

func _ready():
	var connect_handler_output
	
	file_obj.open(FILE_NAME, File.READ)
	connect_handler_output = Reader.connect("EOF_reached", self, "close_file")
	
	if connect_handler_output:
		push_error('Error occurs in MainLevelNode, when connect signals. ' +
				   'Code: ' + str(connect_handler_output))

func close_file():
	print("Closing file " + str(file_obj))
	file_obj.close()
