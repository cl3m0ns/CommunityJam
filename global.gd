extends Node

var map_seed = 0
var RIGHT_ITEM = null
func _ready():
	randomize()
	if !map_seed:
		map_seed = randi()
		seed(map_seed)
		print("Seed: ", map_seed)