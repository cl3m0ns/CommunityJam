extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func fade_in():
	visible = true
	$transition.modulate.a = 1
	$AnimationPlayer.play("fade in")
	yield($AnimationPlayer, "animation_finished")
	visible = false

func fade_out():
	visible = true
	$transition.modulate.a = 0
	$AnimationPlayer.play("fade out")
	yield($AnimationPlayer, "animation_finished")
	visible = false

func fade_out_and_in():
	GLOBAL.FADING = true
	visible = true
	$transition.modulate.a = 0
	$AnimationPlayer.play("fade out")
	yield($AnimationPlayer, "animation_finished")
	$transition.modulate.a = 1
	$AnimationPlayer.play("fade in")
	yield($AnimationPlayer, "animation_finished")
	GLOBAL.FADING = false