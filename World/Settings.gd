extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_EasyMode_pressed():
	GLOBAL.LOOP_TIME = GLOBAL.easy_time
	GLOBAL.GOALS = GLOBAL.easy_goal
	start_game()


func _on_RegularMode_pressed():
	GLOBAL.LOOP_TIME = GLOBAL.regular_time
	GLOBAL.GOALS = GLOBAL.regular_goal
	start_game()


func _on_HardMode_pressed():
	GLOBAL.LOOP_TIME = GLOBAL.hard_time
	GLOBAL.GOALS = GLOBAL.hard_goal
	start_game()
	
func start_game():
	get_tree().change_scene("res://World/World.tscn")