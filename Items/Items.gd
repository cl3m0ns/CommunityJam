extends Node2D

var TYPE = "ITEM"
var picked_up = false
var homePos = Vector2.ZERO

func _ready():
	homePos = get_global_position() 
	$items.frame = choose([0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31])
	pass # Replace with function body.
	
func _physics_process(delta):
	if picked_up:
		var playerPos = get_parent().get_parent().find_node("Player").get_global_position()
		set_global_position(Vector2(playerPos.x + 6, playerPos.y - 56)) 

func choose(array):
	array.shuffle()
	return array.front()

func hide():
	visible = false

func show():
	visible = true

func go_home():
	position = homePos