extends Node2D
var TYPE = "ROBO"
var isTalking = false
var showIcon = false
var defaultSpeed = 0

var tut4 = preload("res://TutorialDialog/tutorial_4.png")
var taunt1 = preload("res://TauntTalk/closed_1.png")
var taunt2 = preload("res://TauntTalk/closed_2.png")
var taunt3 = preload("res://TauntTalk/closed_3.png")
var taunt4 = preload("res://TauntTalk/closed_4.png")
var taunt5 = preload("res://TauntTalk/closed_5.png")
var taunt6 = preload("res://TauntTalk/closed_6.png")
var taunt7 = preload("res://TauntTalk/closed_7.png")

func _ready():
	$arrow.visible = false
	$AnimationPlayer.play("idle")
	defaultSpeed = $AnimationPlayer.get_speed_scale()
	
func _physics_process(delta):
	if isTalking:
		$RoboDialog.visible = true
	else:
		$RoboDialog.visible = false
		
	if showIcon:
		$arrow.visible = true
	else:
		$arrow.visible = false

func update_dialog():
	var sprite = choose([taunt2, taunt3, taunt4, taunt5, taunt6, taunt7])
	match GLOBAL.CURR_DAY:
		0:
			sprite = tut4
		1:
			sprite = taunt1
	
	$RoboDialog.set_sprite(sprite)

func choose(array):
	array.shuffle()
	return array.front()