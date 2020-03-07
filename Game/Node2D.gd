extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var timeShift = 1.0
var shiftJuice = 200
export var isShifting = false

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Engine.time_scale = timeShift

	pass


func _on_Down_toggled(button_pressed):
	$Square.modulate = GM.gradientSpr.interpolate(randf())
#	print("derp")
#	if(button_pressed):
#		timeShift = 0.5
#		isShifting = true
#		$CanvasLayer/TimeShifter.playback_speed = 2
#		$CanvasLayer/TimeShifter.play("Down")
#	else:
#		$CanvasLayer/TimeShifter.stop()
#		isShifting = false
#		timeShift = 1
#		$CanvasLayer/CPUParticles2D.gravity = Vector2()
	pass # Replace with function body.


func _on_Up_toggled(button_pressed):
#	if(button_pressed):
#		timeShift = 2
#		isShifting = true
#		$CanvasLayer/TimeShifter.playback_speed = 0.5
#		$CanvasLayer/TimeShifter.play("Up")
#	else:
#		$CanvasLayer/TimeShifter.stop()
#		isShifting = false
#		timeShift = 1
#		$CanvasLayer/CPUParticles2D.gravity = Vector2()
	pass # Replace with function body.
