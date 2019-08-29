extends Node

var map_seed = 0
var RIGHT_ITEM = null
var STORE_OPEN = false
var CUST_SPAWN_POS = Vector2(300, 150)
var NEXT_CUST = false
var CURRENT_CUSTOMER = null
var CURR_DAY = 0
var DAY_CUST = [
[1], 
[1,1], 
[1,1,1],
[1,1,1,1], 
[1,1,1,1,1,1], 
[1,1,1,1,1,1,1,1], 
[1,1,1,1,1,1,1,1,1,10],
[1,1,1,1,1,1,1,1,1,10,11,12],
[1,1,1,1,1,1,1,1,1,10,11,12,13],
[1,1,1,1,1,1,1,1,1,10,11,12,13,14],
[1,1,1,1,1,1,1,1,1,10,11,12,13,14,15],
[1,1,1,1,1,1,1,1,1,10,11,12,13,14,15,16],
[1,1,1,1,1,1,1,1,1,10,11,12,13,14,15,16],
[1,1,1,1,1,1,1,1,1,10,11,12,13,14,15,16],
[1,1,1,1,1,1,1,1,1,10,11,12,13,14,15,16],
[1,1,1,1,1,1,1,1,1,10,11,12,13,14,15,16],
[1,1,1,1,1,1,1,1,1,10,11,12,13,14,15,16]]
var STORY_TIME = false
var TUT_TIME = false
var FADING = false
var RESET = true
var LOSE_CASH = 0
func _ready():
	randomize()
	if !map_seed:
		map_seed = randi()
		seed(map_seed)
		
