extends Node2D


var section1 = preload("res://Levels/Section1.tscn")
var section2 = preload("res://Levels/Section2.tscn")
#var section2 = preload("res://Levels/Section2.tscn")

var sectionList = []

var currentSeason = 1
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var started = false
var modif = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	sectionList.push_back($Dummy)
	sectionList.push_back($Tutorial)
	sectionList.push_back($Section1)
	pass # Replace with function body.

func start_game():
	print("go time")
	started = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(started):
		$EndWall.global_position.x+=delta*modif
		modif+=delta*0.85
		if(GM.player.real_pos().x-$EndWall.global_position.x>500):
			$EndWall.global_position.x+=delta*26
	pass

func section_reached(section):
	print("new section")
	var newSec 
	if(randf()>0.5):
		newSec = section1.instance()
	else:
		newSec = section2.instance()
	newSec.global_position = section.global_position + Vector2(1456,0)
	sectionList.push_back(newSec)
	sectionList.front().queue_free()
	sectionList.pop_front()
	
	add_child(newSec)
	pass

func _on_EndWall_body_entered(body):
	GM.player.lose()
	pass # Replace with function body.
