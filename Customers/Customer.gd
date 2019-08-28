extends KinematicBody2D
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (int) var SPEED = 150
var sprite1 = preload("res://Customers/character1.png")
var sprite2 = preload("res://Customers/character2.png")
var sprite3 = preload("res://Customers/character3.png")
var sprite4 = preload("res://Customers/character4.png")
var sprite5 = preload("res://Customers/character5.png")
var sprite6 = preload("res://Customers/character6.png")
var current_customer = false
var q_pos = null
var move_to_spot = Vector2(0,0)
var start_moving = false
var leaveShop = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$Happy.visible = false
	$Sad.visible = false
	var texure = choose([sprite1, sprite2, sprite3, sprite4, sprite5, sprite6])
	$Sprite.set_texture(texure)
	$AnimationPlayer.play("idle")
	pass # Replace with function body.

func _physics_process(delta):
	if start_moving:
		$AnimationPlayer.play("move")
		move()
	if leaveShop:
		leave_shop()

func do_outcome(isHappy):
	if isHappy:
		$Happy.visible = true
		$Sad.visible = false
		leaveShop = true
	else:
		$Happy.visible = false
		$Sad.visible = true

func choose(array):
	array.shuffle()
	return array.front()
	
func stop():
	$AnimationPlayer.play("idle")
	start_moving = false
	move_to_spot = Vector2.ZERO

func leave_shop():
	var distToSpot = get_global_position().distance_to(GLOBAL.CUST_SPAWN_POS); 
	var  moveDir = (GLOBAL.CUST_SPAWN_POS - position).normalized() * SPEED
	if distToSpot < 12:
		queue_free()
	move_and_slide(moveDir, Vector2.ZERO)

func move():
	if move_to_spot != Vector2.ZERO:
		var distToSpot = get_global_position().distance_to(move_to_spot); 
		var  moveDir = (move_to_spot - position).normalized() * SPEED
		if distToSpot < 12:
			stop()
		move_and_slide(moveDir, Vector2.ZERO)
