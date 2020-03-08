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
func fire(player:bool,dmg,season,delay=2):
	$Point.damange = dmg
	$Point.season = season
	$TimerDelay.start(0)
	if (player):
		$Point.set_collision_layer_bit(2,true)
	else:
		$Point.set_collision_layer_bit(4,true)
	pass
	
	


func _on_TimerDelay_timeout():
	apply_central_impulse(Vector2(1200,0))
	pass # Replace with function body.
