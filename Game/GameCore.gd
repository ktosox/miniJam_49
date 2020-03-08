extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var started = false
var modif = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func start_game():
	print("go time")
	started = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(started):
		$EndWall.global_position.x+=delta*modif
		modif+=delta
		if(GM.player.real_pos().x-$EndWall.global_position.x>500):
			$EndWall.global_position.x+=delta*60
	pass


func _on_EndWall_body_entered(body):
	GM.player.lose()
	pass # Replace with function body.
