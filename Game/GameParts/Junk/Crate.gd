extends RigidBody2D

var dropScene = preload("res://GameParts/Junk/PickUp.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func drop_item():
	var item_ID = GM.generate_item()
	
	pass