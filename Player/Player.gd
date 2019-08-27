extends KinematicBody2D

export (int) var SPEED = 150
var moveDir = Vector2.ZERO
enum states { IDLE, MOVE }
var state = states.IDLE

var holding_item = false
var item_were_holding = null

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
	get_cash_collision()
	get_open_collision()
	if holding_item:
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
		place_item(body)


func get_open_collision():
	var body = get_body("OPENSTORE")
	if body && Input.is_action_just_pressed("interact") && !GLOBAL.STORE_OPEN:
		open_store()

func open_store():
	GLOBAL.STORE_OPEN = true
	var parent = get_parent()
	var store = parent.get_node("OpenStore")
	var door = parent.get_node("Door")
	store.get_node("Sprite").frame = 0
	door.visible = false

func get_item_collisions():
	var item = get_body_parent("ITEM")
	if item && Input.is_action_just_pressed("interact") && holding_item != true:
		item.picked_up = true
		holding_item = true
		item_were_holding = item
		$PickupCooldown.wait_time = 0.4
		$PickupCooldown.start()

func get_robot_collision():
	pass

func get_cash_collision():
	var body = get_body("CASH REG")
	if body && Input.is_action_just_pressed("interact") && $PickupCooldown.is_stopped() && holding_item:
		sell_item()

func sell_item():
	var cashReg = get_parent().get_node('CashReg')
	if GLOBAL.RIGHT_ITEM == item_were_holding:
		cashReg.good = true
		get_parent().cash += 5
	else:
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