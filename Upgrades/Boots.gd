extends Node2D

func _ready():
	$AnimationPlayer.play("anim")

func _on_Timer_timeout():
	queue_free()

func _on_AudioTimer_timeout():
	if !GLOBAL.SFX:
		$booties.stop()
	elif GLOBAL.SFX && !$booties.is_playing():
		$booties.play()
