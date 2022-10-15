extends Node2D

const FILE_NAME := "res://Plot/SampleText.txt"
var file_obj = File.new()
onready var Reader := get_node("FileReader")

func _ready():
	file_obj.open(FILE_NAME, File.READ)
	Reader.connect("EOF_reached", self, "close_file")

func close_file():
	print("Closing file " + str(file_obj))
	file_obj.close()
