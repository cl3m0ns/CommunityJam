extends Node2D


func _ready():
	if GLOBAL.MUSIC:
		$Music.play()
	$Transition/MoneyLabel.set_text("You earned: $" + String(GLOBAL.LOSE_CASH))
	pass # Replace with function body.

func _physics_process(delta):
	if !GLOBAL.MUSIC:
		$Music.stop()
	elif GLOBAL.MUSIC && !$Music.is_playing():
		$Music.play()
	if Input.is_action_pressed("interact") && $ContinueTImer.is_stopped():
		GLOBAL.RESET = true
		get_tree().change_scene("res://World/World.tscn")
