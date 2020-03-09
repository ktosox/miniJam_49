extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var item_ID

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func update_drop():
	var target = GM.ID_to_item(item_ID)
	$Body.texture = target[6]
	$Body.modulate = target[5]
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_PickUp_body_entered(body):
	if(GM.playerEQ.count(0)>0):
		GM.update_player_weapon(item_ID)
		self.queue_free()
	pass # Replace with function body.
