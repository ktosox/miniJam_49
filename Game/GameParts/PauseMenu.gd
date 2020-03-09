extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$CanvasLayer2/Layout/Panel/ItemSlot.item_ID = GM.playerEQ[0]
	$CanvasLayer2/Layout/Panel/ItemSlot.update_item()
	$CanvasLayer2/Layout/Invetnory/ItemSlot1.item_ID = GM.playerEQ[1]
	$CanvasLayer2/Layout/Invetnory/ItemSlot1.update_item()
	$CanvasLayer2/Layout/Invetnory/ItemSlot2.item_ID = GM.playerEQ[2]
	$CanvasLayer2/Layout/Invetnory/ItemSlot2.update_item()
	$CanvasLayer2/Layout/Invetnory/ItemSlot3.item_ID = GM.playerEQ[3]
	$CanvasLayer2/Layout/Invetnory/ItemSlot3.update_item()
	$CanvasLayer2/Layout/Invetnory/ItemSlot4.item_ID = GM.playerEQ[4]
	$CanvasLayer2/Layout/Invetnory/ItemSlot4.update_item()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func update_description():
	pass

func _on_Button_pressed():
	#GM.update_player_weapon()
	get_tree().paused=false
	self.queue_free()
	pass # Replace with function body.


func _on_ItemSlot_minimum_size_changed():
	update_description() #update description goes here

