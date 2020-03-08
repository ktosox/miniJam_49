extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var bulletScene = preload("res://GameParts/Attacks/Bullet.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

func attack():
	var bullet = bulletScene.instance()
	
	get_parent().add_child(bullet)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
