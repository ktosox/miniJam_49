extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func pop():
	pass
	
func get_damange():
	var obj = []
	obj.push_back(2)
	obj.push_back(-1)
	return obj
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass




func _on_HitBox_area_entered(area):
	area.pop()
	if(!$Animator.is_playing()):
		$Animator.play("Boom")

	pass # Replace with function body.
