extends Area2D

var TYPE = "OPENSTORE"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if GLOBAL.STORE_OPEN:
		$Sprite.frame = 0
	else:
		$Sprite.frame = 1
