extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var prefix = [
	"bo",
	"ta",
	"ro",
	"we",
	"hi",
	"fa",
	"lu",
	"vi",
	"so",
	"gi"
	]
var base = [
	"nar",
	"hog",
	"dex",
	"rom",
	"far",
	"qor",
	"kon",
	"bar",
	"tog",
	"nam",
	"pig",
	"kin",
	"pog",
	"kap"
	]
var postfix = [
	"ho",
	"no",
	"ri",
	"ke",
	"wi",
	"fo",
	"le",
	"ki",
	"wu",
	"pi"
	]

export var gradientSpr = preload("res://Resources/Colors/gradient_Spr.tres")
export var gradientAut = preload("res://Resources/Colors/gradient_Aut.tres")
export var gradientSum = preload("res://Resources/Colors/gradient_Sum.tres")
export var gradientWin = preload("res://Resources/Colors/gradient_Win.tres")


var player = null

var itemList = {} # keeps pairs 

var lastID = 60

var playerEQ = [1,0,0,0,0]
# Called when the node enters the scene tree for the first time.
func _ready():
	addBoxCuter()
	randomize()
	playerEQ[2]=generate_item()
	playerEQ[1]=generate_item()
	pass # Replace with function body.
func get_gradient(pos:int):
	match pos:
		0:
			return gradientWin
		1:
			return gradientSpr
		2:
			return gradientSum
		3:
			return gradientAut
	pass


func generate_item():
	lastID+=1
	var ID = lastID
	var newItem=[]
	var pointPool = 20
	newItem.push_back(-1+randi()%4) #set season
	newItem.push_back(randi()%2) # set weapon type
	newItem.push_back(1+randi()%3) # set dmg
	pointPool -= newItem[2]*3
	newItem.push_back((pointPool-randf()*4)/(pointPool-newItem[2]*2)) # set CD
	newItem.push_back(pointPool+randi()%6) # set Ammo
	if(newItem[0]!=-1):
		newItem.push_back(GM.get_gradient(newItem[0]).interpolate(0))
	else:
		newItem.push_back(Color(1,1,1,1))
	newItem[5].r *= 1-randf()*0.1
	newItem[5].g *= 1-randf()*0.1
	newItem[5].b *= 1-randf()*0.1
	var texture
	match randi()%5:
		0:
			texture = load("res://Resources/Particles/Circle.png")
		1:
			texture = load("res://Resources/Particles/Orb.png")
		2:
			texture = load("res://Resources/Particles/Bar_thick.png")
		3:
			texture = load("res://Resources/Particles/Square.png")
		4:
			texture = load("res://Resources/Particles/Grid_full.png")
			
	newItem.push_back(texture)
	var itemName = base[randi()%base.size()]
	if(randf()>0.32):
		itemName = prefix[randi()%prefix.size()] + "-" + itemName
	if(randf()>0.17):
		itemName = itemName + prefix[randi()%prefix.size()]
	if(itemName.length()<4):
		itemName = itemName + base[randi()%base.size()]
	newItem.push_back(itemName)
	itemList[ID]=newItem
	return ID

func update_player_weapon(ID):
	if(player == null):
		print("no player lul xD")
		return
	player.currentWeaponID = ID
	player.change_weapon()
	pass

func ID_to_item(ID):
	return itemList[ID]

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func reset_game():
	playerEQ = [1,0,0,0,0]
	itemList.clear()
	addBoxCuter()
	get_tree().change_scene("res://GameCore.tscn")
	get_tree().paused=false
	pass

func end_game():
	player.lose()
	pass

func addBoxCuter():
	var item = []
	item.push_back(-1) #season
	item.push_back(0) # type
	item.push_back(1)# dmg
	item.push_back(1)# CD
	item.push_back(-1) # ammo
	item.push_back(Color(1,1,1,1)) # color
	item.push_back(load("res://Resources/Particles/Core.png"))
	item.push_back("box-cutter")
	itemList[1]=item
	pass
