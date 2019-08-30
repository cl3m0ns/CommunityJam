extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	if GLOBAL.MUSIC:
		$music.play()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !GLOBAL.MUSIC:
		$music.stop()
	elif GLOBAL.MUSIC && !$music.is_playing():
		$music.play()


func _on_EasyMode_pressed():
	if !GLOBAL.SFX:
		$select.stop()
	elif GLOBAL.SFX && !$select.is_playing():
		$select.play()
	
	GLOBAL.LOOP_TIME = GLOBAL.easy_time
	GLOBAL.GOALS = GLOBAL.easy_goal
	start_game()


func _on_RegularMode_pressed():
	if !GLOBAL.SFX:
		$select.stop()
	elif GLOBAL.SFX && !$select.is_playing():
		$select.play()
	GLOBAL.REG = true
	GLOBAL.LOOP_TIME = GLOBAL.regular_time
	GLOBAL.GOALS = GLOBAL.regular_goal
	start_game()


func _on_HardMode_pressed():
	if !GLOBAL.SFX:
		$select.stop()
	elif GLOBAL.SFX && !$select.is_playing():
		$select.play()
	GLOBAL.HARD = true
	GLOBAL.LOOP_TIME = GLOBAL.hard_time
	GLOBAL.GOALS = GLOBAL.hard_goal
	start_game()
	
func start_game():
	get_tree().change_scene("res://World/World.tscn")

func _on_MusicToggle_toggled(button_pressed):
	if button_pressed:
		GLOBAL.MUSIC = true
	else:
		GLOBAL.MUSIC = false
	if !GLOBAL.SFX:
		$select.stop()
	elif GLOBAL.SFX && !$select.is_playing():
		$select.play()


func _on_SoundEffectsToggle_toggled(button_pressed):
	if button_pressed:
		GLOBAL.SFX = true
		if !GLOBAL.SFX:
			$select.stop()
		elif GLOBAL.SFX && !$select.is_playing():
			$select.play()
	else:
		GLOBAL.SFX = false
	pass # Replace with function body.


func _on_SkipTutorial_toggled(button_pressed):
	if button_pressed:
		GLOBAL.RESET = true
	else:
		GLOBAL.RESET = false
