extends Node2D

@export var sprite_body: CompressedTexture2D
@export var sprite_emotion: CompressedTexture2D
@export var sprite_overlay: CompressedTexture2D


@onready var body := $BodySprite
@onready var emotion := $EmotionSprite
@onready var overlay := $OverlaySprite

func _ready():
	# initialise character
	body.texture = sprite_body
	emotion.texture = sprite_emotion
	overlay.texture = sprite_overlay

