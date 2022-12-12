extends Node2D

onready var Dialogue: Node

onready var lbl := get_node("Label")
onready var tpc := get_node("TextProceedController")

func get_dialogue_node():
	Dialogue = get_node("DialogueExample")
	return Dialogue

func _process(_delta):
	var ch
	ch = tpc.STATE
	lbl.text = str(ch)
