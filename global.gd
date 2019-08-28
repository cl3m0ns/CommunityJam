extends Node

var map_seed = 0
var RIGHT_ITEM = null
var STORE_OPEN = false
var CUST_SPAWN_POS = Vector2(300, 150)
var NEXT_CUST = false
var CURRENT_CUSTOMER = null
func _ready():
	randomize()
	if !map_seed:
		map_seed = randi()
		seed(map_seed)
		print("Seed: ", map_seed)