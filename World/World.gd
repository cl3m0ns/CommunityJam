extends Node2D

var cash = 0
var customer = preload("res://Customers/Customer.tscn")
var items = []
var customers = []
var startLoop = false
var loop_times = [10.1, 100.1, 90.1, 80.1, 70.1, 70.1, 70.1, 70.1,70.1,70.1,70.1,70.1,70.1,70.1,70.1,70.1]
var goal_num = [55, 115, 180, 250, 330, 420, 520, 630,745,865,990,1120,1250,1380,1510,1640, 1770]
var goal = 50
var sprite1 = preload("res://PuzzleDialog/blue_dots.png")
var sprite2 = preload("res://PuzzleDialog/blue_solid.png")
var sprite3 = preload("res://PuzzleDialog/blue_striped.png")
var sprite4 = preload("res://PuzzleDialog/green_dots.png")
var sprite5 = preload("res://PuzzleDialog/green_solid.png")
var sprite6 = preload("res://PuzzleDialog/green_striped.png")
var sprite7 = preload("res://PuzzleDialog/orange_dots.png")
var sprite8 = preload("res://PuzzleDialog/orange_solid.png")
var sprite9 = preload("res://PuzzleDialog/orange_striped.png")
var sprite10 = preload("res://PuzzleDialog/pink_dots.png")
var sprite11 = preload("res://PuzzleDialog/pink_solid.png")
var sprite12 = preload("res://PuzzleDialog/pink_striped.png")
var sprite13 = preload("res://PuzzleDialog/purple_dots.png")
var sprite14 = preload("res://PuzzleDialog/purple_solid.png")
var sprite15 = preload("res://PuzzleDialog/purple_striped.png")
var sprite16 = preload("res://PuzzleDialog/red_dots.png")
var sprite17 = preload("res://PuzzleDialog/red_solid.png")
var sprite18 = preload("res://PuzzleDialog/red_striped.png")
var sprite19 = preload("res://PuzzleDialog/white_dots.png")
var sprite20 = preload("res://PuzzleDialog/white_solid.png")
var sprite21 = preload("res://PuzzleDialog/white_striped.png")
var sprite22 = preload("res://PuzzleDialog/yellow_dots.png")
var sprite23 = preload("res://PuzzleDialog/yellow_solid.png")
var sprite24 = preload("res://PuzzleDialog/yellow_striped.png")

var speedBoots = preload("res://Upgrades/Boots.tscn")

var storyDone = false
var storyIndex = 1
var story1 = preload("res://StoryDialog/story_1.png")
var story2 = preload("res://StoryDialog/story_2.png")
var story3 = preload("res://StoryDialog/story_3.png")

var tutIndex = 1
var tutDone = false
var tut1 = preload("res://TutorialDialog/tutorial_1.png")
var tut2 = preload("res://TutorialDialog/tutorial_2.png")
var tut3 = preload("res://TutorialDialog/tutorial_3.png")
var tut4 = preload("res://TutorialDialog/tutorial_4.png")
var firstGuess = true
var currentPuzzle = null
var puzzle = [
	{
		"spriteName": sprite1,
		"mustHave": 22,
		"good": [0,1,2,3,7,8,9,10,11,12,13,15,24,25,26,27,31],
   		"bad": [4,5,6,14,16,17,18,19,20,21,22,23,28,29,30]
	},
	{
		"spriteName": sprite2,
		"mustHave": 14,
		"good": [0,1,2,3,7,16,17,18,19,23,24,25,26,27,31],
   		"bad": [4,5,6,8,9,10,11,12,13,14,15,20,21,22,28,29,30]
	},
	{
		"spriteName": sprite3,
		"mustHave": 6,
		"good": [8,9,10,11,12,13,15,16,17,18,19,23],
   		"bad": [0,1,2,3,4,5,6,7,14,20,21,22,24,25,26,27,28,29,30,31]
	},
	{
		"spriteName": sprite4,
		"mustHave": 17,
		"good": [0,2,3,4,5,6,7,8,10,11,12,13,14,15,24,26,27,28,29,30,31],
   		"bad": [1,9,16,17,18,19,20,21,22,23,25]
	},
	{
		"spriteName": sprite5,
		"mustHave": 9,
		"good": [0,2,3,4,5,6,7,16,18,19,20,21,22,23,24,26,27,28,29,30,31],
   		"bad": [1,8,9,10,11,12,13,14,15,17,25]
	}, 
	{
		"spriteName": sprite6,
		"mustHave": 1,
		"good": [8,10,11,12,13,14,15,16,18,19,20,21,22,23],
   		"bad": [0,1,2,3,4,5,6,7,9,17,24,25,26,27,28,29,30,31]
	}, 
	{
		"spriteName": sprite7,
		"mustHave": 16,
		"good": [1,2,3,4,5,6,7,9,10,11,12,13,14,15,25,26,27,28,29,30,31],
   		"bad": [0,8,16,17,18,19,20,21,22,23,24]
	},
	{
		"spriteName": sprite8,
		"mustHave": 8,
		"good": [1,2,3,4,5,6,7,17,18,19,20,21,22,23,25,26,27,28,29,30,31],
   		"bad": [0,8,9,10,11,12,13,14,15,16,24]
	},
	{
		"spriteName": sprite9,
		"mustHave": 0,
		"good": [9,10,11,12,13,14,15,17,18,19,20,21,22,23],
   		"bad": [0,1,2,3,4,5,6,7,8,16,24,25,26,27,28,29,30,31]
	},
	{
		"spriteName": sprite10,
		"mustHave": 23,
		"good": [0,1,2,3,4,5,6,8,9,10,11,12,13,14,24,25,26,27,28,29,30],
   		"bad": [7,15,16,17,18,19,20,21,22,23,31]
	},
	{
		"spriteName": sprite11,
		"mustHave": 15,
		"good": [0,1,2,3,4,5,6,16,17,18,19,20,21,22,24,25,26,27,28,29,30],
   		"bad": [7,8,9,10,11,12,13,14,15,23,31]
	},
	{
		"spriteName": sprite12,
		"mustHave": 7,
		"good": [8,9,10,11,12,13,14,16,17,18,19,20,21,22],
   		"bad": [0,1,2,3,4,5,6,7,15,23,24,25,26,27,28,29,30,31]
	},
	{
		"spriteName": sprite13,
		"mustHave": 18,
		"good": [1,3,4,5,6,8,9,11,12,13,14,15,25,27,28,29,30],
   		"bad": [0,2,7,10,16,17,18,19,20,21,22,23,24,26,31]
	},
	{
		"spriteName": sprite14,
		"mustHave": 10,
		"good": [1,3,4,5,6,17,19,20,21,22,25,27,28,29,30],
   		"bad": [0,2,7,8,9,10,11,12,13,14,15,16,18,23,24,26,31]
	},
	{
		"spriteName": sprite15,
		"mustHave": 2,
		"good": [8,9,11,12,13,14,15,17,19,20,21,22],
   		"bad": [0,1,2,3,4,5,6,7,10,16,18,23,24,25,26,27,28,29,30,31]
	},
	{
		"spriteName": sprite16,
		"mustHave": 19,
		"good": [0,1,2,4,5,6,7,8,9,10,12,13,14,15,24,25,26,28,29,30,31],
   		"bad": [3,11,16,17,18,19,20,21,22,23,27]
	},
	{
		"spriteName": sprite17,
		"mustHave": 11,
		"good": [0,1,2,4,5,6,7,16,17,18,20,21,22,23,24,25,26,28,29,30,31],
   		"bad": [3,8,9,10,11,12,13,14,15,19,27]
	},
	{
		"spriteName": sprite18,
		"mustHave": 3,
		"good": [8,9,10,12,13,14,15,16,17,18,20,21,22,23],
   		"bad": [0,1,2,3,4,5,6,7,11,19,24,25,26,27,28,29,30,31]
	},
	{
		"spriteName": sprite19,
		"mustHave": 20,
		"good": [0,2,5,6,7,8,9,10,11,13,14,15,24,26,29,30,31],
   		"bad": [1,3,4,12,16,17,18,19,20,21,22,23,25,27,28]
	},
	{
		"spriteName": sprite20,
		"mustHave": 12,
		"good": [0,2,5,6,7,16,18,21,22,23,24,26,29,30,31],
   		"bad": [1,3,4,8,9,10,11,12,13,14,15,17,19,20,25,27,28]
	},
	{
		"spriteName": sprite21,
		"mustHave": 4,
		"good": [8,9,10,11,13,14,15,16,18,21,22,23],
   		"bad": [0,1,2,3,4,5,6,7,12,17,19,20,24,25,26,27,28,29,30,31]
	},
	{
		"spriteName": sprite22,
		"mustHave": 21,
		"good": [0,1,3,4,7,8,9,10,11,12,14,15,24,25,27,28,31],
   		"bad": [2,5,6,13,16,17,18,19,20,21,22,23,26,29,30]
	},
	{
		"spriteName": sprite23,
		"mustHave": 13,
		"good": [0,1,3,4,7,16,17,19,20,23,24,25,27,28,31],
   		"bad": [2,5,6,8,9,10,11,12,13,14,15,18,21,22,26,29,30]
	},
	{
		"spriteName": sprite24,
		"mustHave": 5,
		"good": [8,9,10,11,12,14,15,16,17,19,20,23],
   		"bad": [0,1,2,3,4,5,6,7,13,18,21,22,24,25,26,27,28,29,30,31]
	},
]

var switchToTut = true

func _ready():
	#set up items
	var item1 = find_node("ITEMS").get_child(0)
	var item2 = find_node("ITEMS").get_child(1)
	var item3 = find_node("ITEMS").get_child(2)
	var item4 = find_node("ITEMS").get_child(3)
	var item5 = find_node("ITEMS").get_child(4)
	var item6 = find_node("ITEMS").get_child(5)
	items = [item1, item2, item3, item4, item5, item6]
	GLOBAL.RIGHT_ITEM = $ITEMS/Items
	$Player.visible = false
	
	$Transition.fade_in()

func _physics_process(delta):
	$UI/TimeLabel.set_text("Time: " + String(round($LoopTimer.time_left)))
	$UI/MoneyLabel.set_text( "Current Monies: $" + String(cash))
	$UI/GoalLabel.set_text("Bank Goal: $" + String(goal))
	
	if GLOBAL.RESET:
		GLOBAL.RESET = false
		storyDone = true
		tutDone = true
		$Player.visible = true
		cash = 0
		GLOBAL.CURR_DAY = 0
		GLOBAL.RIGHT_ITEM = null
		GLOBAL.STORE_OPEN = false
		GLOBAL.NEXT_CUST = false
		GLOBAL.CURRENT_CUSTOMER = null
		#delete this after
		cash = 100
		#end of delete
	
	if storyDone && tutDone:
		GLOBAL.STORY_TIME = false
		GLOBAL.TUT_TIME = false
		run_game_loop()
	
	if !storyDone:
		run_story()
		
	if storyDone && !tutDone:
		run_tut()

func run_tut():
	if $TutTimer.is_stopped() && switchToTut:
		$Transition.fade_in()
		$TutTimer.wait_time = 3
		$Player.visible = true
		$TutTimer.start()
		update_robot(tut1)
		switchToTut = false
	elif $TutTimer.is_stopped() && !switchToTut:
		print(tutIndex)
		match tutIndex:
			1:
				update_robot(tut1)
			2: 
				update_robot(tut2)
			3: 
				update_robot(tut3)
			4:
				update_robot(tut4)
				
		if tutIndex > 4:
			hide_bot_dialog()
			storyDone = true
			tutDone = true

func run_story():
	GLOBAL.STORY_TIME = true
	show_bot_dialog()
	match storyIndex:
		1:
			update_robot(story1)
		2: 
			update_robot(story2)
		3: 
			update_robot(story3)
	
	if storyIndex > 3:
		if switchToTut:
			GLOBAL.STORY_TIME = false
			GLOBAL.TUT_TIME = true
			$Transition.fade_out()
			$TutTimer.wait_time = 3
			$TutTimer.start()
			storyDone = true


func run_game_loop():
	if GLOBAL.STORE_OPEN:
		goal = goal_num[GLOBAL.CURR_DAY]
		puzzle_loop()
		startLoop = false
	
	if GLOBAL.NEXT_CUST:
		GLOBAL.NEXT_CUST = false
		#remove first customer
		customers.pop_front()
		if customers.empty():
			end_day()
		else:
			set_customer_q_spots()
			move_customers_to_spots()
			pick_item()
			update_robot(currentPuzzle.spriteName)

func do_speed_up():
	if $Player.SPEED == 150:
		$Player.SPEED = 200
		var boots = speedBoots.instance()
		boots.find_node("Upgraded").visible = false
		add_child(boots)
	else:
		$Player.SPEED += 50
		var boots = speedBoots.instance()
		boots.find_node("Unlocked").visible = false
		add_child(boots)

func check_for_upgrade():
	if GLOBAL.CURR_DAY == 3:
		do_speed_up()
	if GLOBAL.CURR_DAY == 5:
		do_speed_up()
	if GLOBAL.CURR_DAY == 7:
		do_speed_up()
	if GLOBAL.CURR_DAY == 9:
		do_speed_up()
	if GLOBAL.CURR_DAY == 11:
		do_speed_up()
	if GLOBAL.CURR_DAY == 13:
		do_speed_up()
	if GLOBAL.CURR_DAY == 15:
		do_speed_up()

func end_day():
	var extraIncome = 0
	if round($LoopTimer.time_left) > 0:
		extraIncome = 50
	cash += extraIncome
	$LoopTimer.stop()
	GLOBAL.CURRENT_CUSTOMER = null
	GLOBAL.CURR_DAY += 1
	if $Player.item_were_holding != null:
		$Player.item_were_holding.go_home()
		$Player.item_were_holding = null
		$Player.holding_item = false
	
	check_for_upgrade()
	
	GLOBAL.STORE_OPEN = false
	$LiarBot.update_dialog()
	var door = get_node("Door")
	door.visible = true
	startLoop = false
	customers = []
	
	do_we_lose()

func do_we_lose():
	if cash < goal_num[GLOBAL.CURR_DAY-1]:
		GLOBAL.LOSE_CASH = cash
		get_tree().change_scene("res://World/Lose.tscn")

func puzzle_loop():
	if startLoop:
		var time = int(loop_times[GLOBAL.CURR_DAY])
		$LoopTimer.set_wait_time(time)
		$LoopTimer.start()
		spawn_customers(GLOBAL.DAY_CUST[GLOBAL.CURR_DAY])
		set_customer_q_spots()
		move_customers_to_spots()
		pick_item()
		update_robot(currentPuzzle.spriteName)
	
	if $LoopTimer.is_stopped():
		for cust in customers:
			cust.leaveShop = true
			cust.do_outcome(false)
		end_day()

func update_robot(sprite):
	$LiarBot/RoboDialog.set_sprite(sprite)

func show_bot_dialog():
	$LiarBot.isTalking = true

func hide_bot_dialog():
	$LiarBot.isTalking = false

func move_customers_to_spots():
	for cust in customers:
		cust.start_moving = true

func pick_item():
	items.shuffle()
	currentPuzzle = choose(puzzle)
	GLOBAL.RIGHT_ITEM = choose(items)
	GLOBAL.RIGHT_ITEM.find_node('items').frame = choose(currentPuzzle.good)
	#set the bad frames
	var mustPicked = false
	for item in items:
		var frameNum = choose(currentPuzzle.bad)
		if item != GLOBAL.RIGHT_ITEM:
			item.find_node('items').frame = frameNum
			if frameNum == currentPuzzle.mustHave:
				mustPicked = true
				
			if item == items.back() && !mustPicked:
				item.find_node('items').frame = currentPuzzle.mustHave
		
	
	item_sparkle()

func set_customer_q_spots():
	var qPos = 0
	for cust in customers:
		cust.q_pos = qPos
		cust.move_to_spot = find_node("QGrid").get_child(qPos).get_global_position()
		if cust == customers[0]:
			GLOBAL.CURRENT_CUSTOMER = cust
			cust.z_index = 2
			firstGuess = true
			cust.current_customer = true
		qPos += 1

func spawn_customers(numCustomers):
	for cust in numCustomers:
		var newCust = customer.instance()
		newCust.set_global_position(GLOBAL.CUST_SPAWN_POS)
		add_child(newCust)
		customers.append(newCust)

func item_sparkle():
	for item in items:
		item.fancy_particles()

func choose(array):
	array.shuffle()
	return array.front()
