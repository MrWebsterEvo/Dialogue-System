extends Node2D

@onready var Dialogue: Node

@onready var TestLabel := get_node("TestLabel")
@onready var Controller := get_node("TextProceedController")

func get_dialogue_node() -> Node2D:
	Dialogue = get_node("DialogueExample")
	return Dialogue

func _process(_delta):
	var state: int
	state = Controller.STATE
	TestLabel.text = str(state)
