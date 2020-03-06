extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var horizontalDir = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _input(event):
	if(event.is_action_pressed("jump") and $Leg.linear_velocity.y >-6):
		$Leg.linear_velocity.y-=290



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
