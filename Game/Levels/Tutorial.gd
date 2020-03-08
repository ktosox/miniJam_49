extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func open_part_2():
	for x in 4:
		for y in 10:
			$TileMap.set_cell(x+35,y+30,-1)
	pass


func _on_Crate_tree_exited():
	open_part_2()
	pass # Replace with function body.
