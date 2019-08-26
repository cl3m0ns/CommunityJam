extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var cash = 0
var lastCash = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	GLOBAL.RIGHT_ITEM = $Customer1/Items
	pass # Replace with function body.

func _physics_process(delta):
	if lastCash != cash:
		$UI/MoneyLabel.set_text( "$" + String(cash))