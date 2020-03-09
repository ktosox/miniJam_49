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
	var new_drop = dropScene.instance()
	new_drop.item_ID = GM.generate_item()
	new_drop.update_drop()
	new_drop.global_position = global_position - get_parent().global_position
	get_parent().add_child(new_drop)
	print(global_position, new_drop.global_position)
	pass


func _on_HitBox_area_entered(area):
	$HitBox/CollisionShape2D.disabled = true
	area.pop()
	drop_item()
	$Die.play("Anim")
	
	pass # Replace with function body.
