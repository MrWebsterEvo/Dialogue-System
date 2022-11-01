extends Node2D

export var sprite_body: StreamTexture
export var sprite_emotion: StreamTexture
export var sprite_overlay: StreamTexture

onready var body := $BodySprite
onready var emotion := $EmotionSprite
onready var overlay := $OverlaySprite

var character_name: String

func _ready():
	body.texture = sprite_body
	emotion.texture = sprite_emotion
	overlay.texture = sprite_overlay
