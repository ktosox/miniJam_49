extends Path2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var target



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func fire(pos):
	target = pos
	set_path()
	$Progress/Core/Animator.play("Fly")

func set_path():
	
	curve.clear_points()
	curve.add_point(Vector2())
	curve.add_point(target)
	curve.add_point(curve.interpolate_baked(0.2),Vector2(randf(),randf()),Vector2(randf(),randf()),1)
	#wobblines goes here
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
