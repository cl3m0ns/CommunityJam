extends KinematicBody2D
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var sprite1 = preload("res://Customers/character1.png")
var sprite2 = preload("res://Customers/character2.png")
var sprite3 = preload("res://Customers/character3.png")
var sprite4 = preload("res://Customers/character4.png")
var sprite5 = preload("res://Customers/character5.png")
var sprite6 = preload("res://Customers/character6.png")
var current_customer = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$Happy.visible = false
	$Sad.visible = false
	var texure = choose([sprite1, sprite2, sprite3, sprite4, sprite5, sprite6])
	$Sprite.set_texture(texure)
	$AnimationPlayer.play("idle")
	pass # Replace with function body.

func do_outcome(isHappy):
	if isHappy:
		$Happy.visible = true
		$Sad.visible = false
	else:
		$Happy.visible = false
		$Sad.visible = true

func choose(array):
	array.shuffle()
	return array.front()
