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

var gradientSpr = preload("res://Resources/Colors/gradient_Spr.tres")
var gradientAut = preload("res://Resources/Colors/gradient_Aut.tres")
var gradientSum = preload("res://Resources/Colors/gradient_Sum.tres")
var gradientWin = preload("res://Resources/Colors/gradient_Win.tres")


var itemList = {} # keeps pairs 

var lastID = 60
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
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
	newItem.push_back(randi()%3) # set weapon type
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

func item_ID_to_stats():
	pass

func item_ID_to_look(ID):
	var req_item = itemList[ID]
	var output  = [req_item[5],req_item[6]]
	return output
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
