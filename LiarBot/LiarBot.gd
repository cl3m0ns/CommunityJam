extends Node2D
var TYPE = "ROBO"
var isTalking = false
var showIcon = false
var defaultSpeed = 0
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