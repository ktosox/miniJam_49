extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func fire(player:bool,dmg,season):
	$Point.damange = dmg
	$Point.season = season
	if (player):
		$Point.set_collision_layer_bit(2,true)
	else:
		$Point.set_collision_layer_bit(4,true)
	pass
	
