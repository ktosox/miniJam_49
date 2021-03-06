extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var horizontalDir = 0.0
var jumpReady = true
var jumpCD = true
var currentShift = 0
var currentWeaponID = 1
var currentWeapon
export var attackReady = true

var pauseMenuScene = preload("res://GameParts/PauseMenu.tscn")

var endGameScene = preload("res://GameParts/EndGame.tscn")

var bulletScene = preload("res://GameParts/Attacks/Bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	GM.player = self
	change_weapon()
	pass # Replace with function body.
func _input(event):
	if(event.is_action_pressed("jump") and jumpReady and jumpCD):
		$Leg.apply_impulse(Vector2(0,-200),Vector2(0,-37000))
		jumpReady = false
		jumpCD = false
		$TimerJump.start()
	if(event.is_action_pressed("shiftFast")):
		if(!currentShift == 1):
			SM.shift_start(true)
			currentShift = 1
			$Leg.gravity_scale = 0.5
		else:
			SM.shift_stop()
			currentShift = 0
			$Leg.gravity_scale = 2.0
		pass
	if(event.is_action_pressed("shiftSlow")):
		if(!currentShift == -1):
			SM.shift_start(false)
			currentShift = -1
			$Leg.gravity_scale=4.0
		else:
			SM.shift_stop()
			$Leg.gravity_scale = 2.0
			currentShift = 0
		pass
	if(event.is_action_pressed("attack") and attackReady):

		attackReady = false
		#$Missile.global_position = $Leg.global_position
		#$Missile.global_rotation = $Leg.global_rotation
		#$Missile.fire($Leg/MissileTarget.position)
		$Attack.playback_speed = currentWeapon[3]
		$Attack.play("Anim")
		match currentWeapon[1]:
			0:
				$Leg/Stab.attack()
			1:
				$Leg/Slice.attack()
			2:
				pass
	if(event.is_action_pressed("ui_cancel")):
		#menu()
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
	$Leg.move= horizontalDir*5

	pass

	

func change_weapon():
	currentWeapon = GM.ID_to_item(currentWeaponID)
	$Head/Core.texture = currentWeapon[6]
	$Head/Core.modulate = currentWeapon[5]
	match currentWeapon[1]:
		0:
			$Leg/Stab.set_stats(currentWeapon[2],currentWeapon[0],currentWeapon[5])
		1:
			$Leg/Slice.set_stats(currentWeapon[2],currentWeapon[0],currentWeapon[5])
		2:
			pass
	pass

func _on_Timer_timeout():
	print($Core.linear_velocity.y)
	pass # Replace with function body.


func _on_Leg_body_entered(body):
	if(body.get_collision_layer_bit(5)):
		jumpReady = true
	pass # Replace with function body.

func real_pos():
	return $Leg.global_position

func menu():
	var pauseMenu = pauseMenuScene.instance()
	$Leg/Camera2D.add_child(pauseMenu)
	get_tree().paused = true
	pass

func lose():
	var endGame = endGameScene.instance()
	$Leg/Camera2D.add_child(endGame)
	get_tree().paused = true

func _on_TimerJump_timeout():
	jumpCD = true
	pass # Replace with function body.
