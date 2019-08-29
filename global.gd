extends Node

var map_seed = 0

var easy_time = [10.1, 100.1, 90.1, 80.1, 70.1, 70.1, 70.1, 70.1,70.1,70.1,70.1,70.1,70.1,70.1,70.1,70.1]
var regular_time = easy_time
var hard_time = easy_time
var LOOP_TIME = easy_time

var easy_goal = [55, 115, 180, 250, 330, 420, 520, 630,745,865,990,1120,1250,1380,1510,1640, 1770]
var regular_goal = [55, 115, 180, 250, 330, 420, 520, 630,745,865,990,1120,1250,1380,1510,1640, 1770]
var hard_goal = [55, 115, 180, 250, 330, 420, 520, 630,745,865,990,1120,1250,1380,1510,1640, 1770]
var GOALS = easy_goal

var MUSIC = true
var SFX = true

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
		
