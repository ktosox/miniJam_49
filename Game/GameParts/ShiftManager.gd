extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var shift = 1.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func shift_start(dir:bool):

	if(dir and !$TimeShifter.current_animation == "Fast"):
		$TimeShifter.play("Fast")

	if(!dir and !$TimeShifter.current_animation == "Slow"):
		$TimeShifter.play("Slow")




func shift_stop():
	$TimeShifter.play("Stop")

func _process(delta):
	$TimeShifter.playback_speed = 1/shift
	Engine.time_scale = shift
	pass
