extends Node

var map_seed = 0

var easy_time = [60.1, 70.1, 80.1, 90.1, 100.1, 100.1, 110.1, 110.1, 120.1, 130.1, 140.1, 150.1]
var regular_time = easy_time
var hard_time = easy_time
var LOOP_TIME = easy_time

var easy_goal = [55, 115, 180, 250, 330, 420, 520, 630, 745, 865, 990, 1120]
var regular_goal = [55, 115, 180, 250, 330, 420, 520, 630, 745, 865, 990, 1120]
var hard_goal = [55, 115, 180, 250, 330, 420, 520, 630, 745, 865, 990, 1120]
var GOALS = easy_goal

var MUSIC = true
var SFX = true
var REG = false
var HARD = false
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
[1,1,1,1,1,1,1,1,1,10,11,12,13,14,15,16]]
var STORY_TIME = false
var TUT_TIME = false
var FADING = false
var RESET = false
var LOSE_CASH = 0
func _ready():
	randomize()
	if !map_seed:
		map_seed = randi()
		seed(map_seed)
		
