extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var move = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _integrate_forces ( state ):
	state.linear_velocity.x = move

	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
