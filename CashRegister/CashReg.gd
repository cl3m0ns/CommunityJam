extends Area2D


var TYPE = "CASH REG"
var good = false
var bad = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if good && $GlowTimer.is_stopped():
		$GoodGlow.emitting = true
		$GlowTimer.wait_time = 1.5
		$cashregister.frame = 0
		$GlowTimer.start()
	if bad && $GlowTimer.is_stopped():
		$BadGlob.emitting = true
		$cashregister.frame = 1
		$GlowTimer.wait_time = 1.5
		$GlowTimer.start()

func _on_GlowTimer_timeout():
	$GoodGlow.emitting = false
	$BadGlob.emitting = false
	$cashregister.frame = 0 
	good = false
	bad = false
