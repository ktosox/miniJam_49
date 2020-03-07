extends TextureRect

var item_preview_scene = load("res://GameParts/Menu/ItemPreview.tscn")

export var item_ID : int

var item_is_dragged = false

func _ready():
	item_ID=GM.generate_item()
	update_item()

func get_drag_data(position):
	if(item_ID == 0):
		return
	var preview = item_preview_scene.instance()
	preview.setTexture(texture)
	preview.item_source = self

	
	set_drag_preview(preview)
	var to_return = [item_ID,self]
	item_is_dragged = true
	self_modulate.a = 0.25
	return to_return

func can_drop_data(position, data):
	return true

func drop_data(position, data):
	data[1].change_item(item_ID)
	change_item(data[0])

func drag_ended(): #called when player is no longer dragging preview
	item_is_dragged = false
	self_modulate.a = 1.0

func update_item(): # change item details 
	if(item_ID == 0):
		texture = null
		self_modulate = Color(1,1,1,1)
	else:
		var look = GM.item_ID_to_look(item_ID)
		self_modulate = look[0]
		texture = look[1]
	updateHint()

func change_item(newID): #set new item ID as input, calls update_item()
	item_ID = newID
	update_item()

func updateHint():
	if(item_ID == 0):
		hint_tooltip = ""
	else:
		hint_tooltip = "this is a weapon"
	pass

	
