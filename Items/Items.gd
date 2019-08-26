extends Node2D

var TYPE = "ITEM"
var picked_up = false

func _ready():
	pass # Replace with function body.
	
func _physics_process(delta):
	if picked_up:
		var playerPos = get_parent().get_parent().find_node("Player").get_global_position()
		set_global_position(Vector2(playerPos.x - 20, playerPos.y - 64)) 