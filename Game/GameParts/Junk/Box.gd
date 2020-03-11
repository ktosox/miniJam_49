extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var HP = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_HitBox_area_entered(area):
	HP -= area.get_damange()[0]
	if(HP<1):
		$Die.play("New Anim")
	area.pop()
	pass # Replace with function body.
