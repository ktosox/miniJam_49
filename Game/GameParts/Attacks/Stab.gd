extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.

func attack():
	$Attack.play("anim")

func set_stats(dmg, season, color):
	$Melee.damange = dmg
	$Melee.season = season
	$CPUParticles2D.modulate = color
	if(season == -1):
		$CPUParticles2D.visible = false
	else:
		$CPUParticles2D.visible = true
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
