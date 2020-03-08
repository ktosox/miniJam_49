extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var season = -1
var damange = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func pop():
	$Animator.play("End")
	pass

func get_damange():
	var obj = [damange,season]
	return obj

