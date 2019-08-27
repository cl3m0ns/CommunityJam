extends KinematicBody2D
export (int) var SPEED = 150
var moveDir = Vector2.ZERO
enum states { IDLE, MOVE }
var state = states.IDLE
var customer = preload("res://Customers/Customer.tscn")
var holding_item = false
var item_were_holding = null
var check_for_bot_exit = false

func _ready():
	pass

func _physics_process(delta):
	get_inputs()
	if moveDir != Vector2.ZERO:
		state = states.MOVE
	else:
		state = states.IDLE
	
	match state:
		states.IDLE:
			$AnimationPlayer.play("idle")
		states.MOVE:
			$AnimationPlayer.play("walk")
			if moveDir.x > 0:
				$player.flip_h = false
			elif moveDir.x < 0:
				$player.flip_h = true
			move()
	
	get_item_collisions()
	get_robot_collision()
	get_open_collision()
	get_bot_exit_collision()
	
	if holding_item:
		get_cash_collision()
		get_stand_collision()

func place_item(standBody):
	var standPosition = standBody.get_global_position()
	item_were_holding.picked_up = false
	item_were_holding.set_position(Vector2(standPosition.x, standPosition.y - 13))
	holding_item = false
	item_were_holding = null

func get_body(type):
	for body in $Hitbox.get_overlapping_areas():
			if body.get("TYPE") == type:
				return body

func get_body_parent(type):
	for body in $Hitbox.get_overlapping_areas():
			var item = body.get_parent()
			if item.get("TYPE") == type:
				return item

func get_stand_collision():
	var body = get_body("STAND")

	if body && Input.is_action_just_pressed("interact") && $PickupCooldown.is_stopped():
		var bName = String(body.name).split("StandBox")
		var itemName = String(item_were_holding.name).split("Items")
		if bName[1] == itemName[1]:
			place_item(body)


func get_open_collision():
	var body = get_body("OPENSTORE")
	if body && !GLOBAL.STORE_OPEN:
		body.showIcon = true
		if Input.is_action_just_pressed("interact"):
			open_store()
	else:
		get_parent().find_node("OpenStore").showIcon = false

func open_store():
	GLOBAL.STORE_OPEN = true
	var parent = get_parent()
	var store = parent.get_node("OpenStore")
	var door = parent.get_node("Door")
	store.get_node("Sprite").frame = 0
	door.visible = false
	test_run()

func test_run():
	var newCust = customer.instance()
	var parent = get_parent()
	var firstGridSpot = parent.find_node("QGrid").get_child(0)
	newCust.set_position(firstGridSpot.get_global_position())
	newCust.current_customer = true
	parent.add_child(newCust)
	GLOBAL.RIGHT_ITEM = get_parent().find_node("ITEMS").get_child(3)
	GLOBAL.RIGHT_ITEM.find_node('items').frame = 9
	var item1 = get_parent().find_node("ITEMS").get_child(0)
	var item2 = get_parent().find_node("ITEMS").get_child(1)
	var item3 = get_parent().find_node("ITEMS").get_child(2)
	var item4 = get_parent().find_node("ITEMS").get_child(4)
	var item5 = get_parent().find_node("ITEMS").get_child(5)
	item1.find_node('items').frame = 0
	item2.find_node('items').frame = 1
	item3.find_node('items').frame = 30
	item4.find_node('items').frame = 8
	item5.find_node('items').frame = 16
	item1.fancy_particles()
	item2.fancy_particles()
	item3.fancy_particles()
	item4.fancy_particles()
	item5.fancy_particles()
	GLOBAL.RIGHT_ITEM.fancy_particles()
	
	

func get_item_collisions():
	var item = get_body_parent("ITEM")
	
	if item && holding_item != true:
		item.showIcon = true
		if Input.is_action_just_pressed("interact"):
			item.picked_up = true
			holding_item = true
			item.showIcon = false
			item_were_holding = item
			$PickupCooldown.wait_time = 0.4
			$PickupCooldown.start()
	else:
		var chillins = get_parent().find_node("ITEMS").get_children()
		for child in chillins:
			child.showIcon = false

func get_robot_collision():
	var robot = get_parent().find_node("LiarBot")
	var body = get_body_parent("ROBO")
	if body && !robot.isTalking:
		robot.showIcon = true
		
	if body && Input.is_action_just_pressed("interact"):
		robot.showIcon = false
		robot.isTalking = true
		check_for_bot_exit = true

func get_bot_exit_collision():
	var robot = get_parent().find_node("LiarBot")
	var body = get_body("EXIT BOT")
	if body:
		robot.showIcon = false
		robot.isTalking = false
		check_for_bot_exit = false


func get_cash_collision():
	var body = get_body("CASH REG")
	if body && holding_item:
		body.showIcon = true
		if Input.is_action_just_pressed("interact") && $PickupCooldown.is_stopped():
			body.showIcon = false
			sell_item()
	else:
		get_parent().find_node("CashReg").showIcon = false

func sell_item():
	var cashReg = get_parent().get_node('CashReg')
	if GLOBAL.RIGHT_ITEM == item_were_holding:
		cashReg.good = true
		get_parent().get_node("Customer").do_outcome(true)
		get_parent().cash += 5
	else:
		get_parent().get_node("Customer").do_outcome(false)
		cashReg.bad = true
	item_were_holding.hide()
	item_were_holding.go_home()
	item_were_holding = null
	holding_item = false

func get_inputs():
	var move_up = Input.is_action_pressed("move_up");
	var move_down = Input.is_action_pressed("move_down");
	var move_right = Input.is_action_pressed("move_right");
	var move_left = Input.is_action_pressed("move_left");
	
	moveDir.x = -int(move_left) + int(move_right)
	moveDir.y = -int(move_up) + int(move_down)

func move():
	move_and_slide(moveDir.normalized()*SPEED, Vector2.ZERO)