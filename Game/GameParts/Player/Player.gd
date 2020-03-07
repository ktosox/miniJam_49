extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var horizontalDir = 0.0
var jumpReady = true
var jumpCD = true
var currentShift = 0

var pauseMenuScene = preload("res://GameParts/PauseMenu.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _input(event):
	if(event.is_action_pressed("jump") and jumpReady and jumpCD):
		$Leg.linear_velocity.y-=260
		jumpReady = false
		jumpCD = false
		$TimerJump.start()
	if(event.is_action_pressed("shiftFast")):
		if(!currentShift == 1):
			SM.shift_start(true)
			currentShift = 1
			$Leg.gravity_scale = 20.0
		else:
			SM.shift_stop()
			currentShift = 0
			$Leg.gravity_scale = 60.0
		pass
	if(event.is_action_pressed("shiftSlow")):
		if(!currentShift == -1):
			SM.shift_start(false)
			currentShift = -1
			$Leg.gravity_scale=100.0
		else:
			SM.shift_stop()
			$Leg.gravity_scale = 60.0
			currentShift = 0
		pass
	if(event.is_action_pressed("attack")):
		$Missile.global_position = $Leg.global_position
		$Missile.global_rotation = $Leg.global_rotation
		$Missile.fire($Leg/MissileTarget.position)
	if(event.is_action_pressed("ui_cancel")):
		menu()
		pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_pressed("left") and !Input.is_action_pressed("right")):
		if(!$Movement.current_animation=="Left"):
			$Movement.play("Left")
	if(Input.is_action_pressed("right") and !Input.is_action_pressed("left")):
		if(!$Movement.current_animation=="Right"):
			$Movement.play("Right")
	if(!Input.is_action_pressed("left") and !Input.is_action_pressed("right")):
		if(!$Movement.current_animation=="Stop"):
			$Movement.play("Stop")
	$Leg.linear_velocity.x = horizontalDir*6
	if($Leg.linear_velocity.y<0):
		$Leg.linear_velocity.y+=delta*260
	pass


func _on_Timer_timeout():
	print($Core.linear_velocity.y)
	pass # Replace with function body.


func _on_Leg_body_entered(body):
	if(body.get_collision_layer_bit(5)):
		jumpReady = true
	pass # Replace with function body.


func menu():
	var pauseMenu = pauseMenuScene.instance()
	$Leg/Camera2D.add_child(pauseMenu)
	get_tree().paused = true
	pass

func _on_TimerJump_timeout():
	jumpCD = true
	pass # Replace with function body.
