extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$Transition/MoneyLabel.set_text("You earned: $" + String(GLOBAL.LOSE_CASH))
	pass # Replace with function body.

func _physics_process(delta):
	
	if Input.is_action_pressed("interact") && $ContinueTImer.is_stopped():
		GLOBAL.RESET = true
		get_tree().change_scene("res://World/World.tscn")
