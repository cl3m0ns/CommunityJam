extends Node2D
var TYPE = "ROBO"
var isTalking = false
var defaultSpeed = 0
func _ready():
	$AnimationPlayer.play("idle")
	defaultSpeed = $AnimationPlayer.get_speed_scale()
	print(defaultSpeed)
	
func _physics_process(delta):
	if isTalking:
		$RoboDialog.visible = true
	else:
		$RoboDialog.visible = false
