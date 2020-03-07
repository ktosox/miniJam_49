extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var season

# Called when the node enters the scene tree for the first time.
func _ready():
	$CPUParticles2D.modulate = GM.get_gradient(randi()%4).interpolate(0)
	pass # Replace with function body.

func attack():
	$Attack.play("anim")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
