extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	for i in 4:
		var copy = $TileMap.duplicate()
		
		var layer = CanvasLayer.new()
		layer.follow_viewport_enable = true
		layer.follow_viewport_scale = 1 - (i)*0.03
		layer.layer =-i
		#layer.scale *= layer.follow_viewport_scale
		print(layer.follow_viewport_scale)
		copy.modulate*=layer.follow_viewport_scale-(i*0.2)
		add_child(layer)
		layer.add_child(copy)
	$TileMap.visible=false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.

