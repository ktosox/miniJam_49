extends StaticBody2D

#top left corner : 0:-18
#bottom right corner: 90:39

var crateScene = preload("res://GameParts/Junk/Crate.tscn")
var boxScene = preload("res://GameParts/Junk/Box.tscn")
var barrelScene = preload("res://GameParts/Junk/Barrel.tscn")
var enemy1Scene = preload("res://GameParts/Enemies/FloaterFiona.tscn")

func _ready():
	randomize()
	placeholder_replace()
	pass # Replace with function body.

func placeholder_replace(): # replaces placeholder tiles with stuff
	for x in 90 :
		for y in range(60):
			y -=18

			match $TileMap.get_cell(x,y) :
				1:
					$TileMap.set_cell(x,y,-1) # remove placholder tile
					spawn_enemy($TileMap.map_to_world(Vector2(x,y)*4))
				2:
					$TileMap.set_cell(x,y,-1) # remove placholder tile
					spawn_junk($TileMap.map_to_world(Vector2(x,y)*4))
				3:
					$TileMap.set_cell(x,y,-1) # remove placholder tile
					spawn_loot($TileMap.map_to_world(Vector2(x,y)*4))
					pass
	pass

func spawn_junk(pos):
	var junk
	var roll = randi()%7
	if( roll >4):
		junk = barrelScene.instance()
	elif(roll>0):
		junk = boxScene.instance()
	else:
		return
	junk.global_position = pos
	add_child(junk)
		
	pass
	
func spawn_enemy(pos):
	var enemy = enemy1Scene.instance()
	enemy.global_position = pos
	add_child(enemy)
	pass

func spawn_loot(pos):
	var loot = crateScene.instance()
	loot.global_position = pos
	add_child(loot)
	pass
