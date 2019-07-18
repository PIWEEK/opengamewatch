extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var speed = 2.5
var offset = 2.5
var delay = 2.5

var pos = [0,0]
var coord_sprites
var m_children
var t
var tend

var time
var indexmeteor
var child

func play():
	get_node("mmove").play()


# Called when the node enters the scene tree for the first time.
func _ready():

	var m5_1 = get_node("m5_1")
	var m5_2 = get_node("m5_2")
	var m5_3 = get_node("m5_3")
	var m5_4 = get_node("m5_4")
	var m5_5 = get_node("m5_5")
	var m5_6 = get_node("m5_6")
	var m5_7 = get_node("m5_7")

	coord_sprites = {[5,1]: m5_1, [5,2]: m5_2, [5,3]: m5_3, [5,4]: m5_4, [5,5]: m5_5, [5,6]: m5_6, [5,7]: m5_7}
	
	m_children = [[5,1],[5,2],[5,3],[5,4],[5,5],[5,6],[5,7]]

	time = 0
	indexmeteor = 0
	pos = [5,1]
	child = coord_sprites[pos]
	child.visible = true

func _process(delta):
	time += delta
	if time > delay:
		
		if time > speed:
			if indexmeteor != 0:
				pos = m_children[indexmeteor-1]
				child = coord_sprites[pos]
				child.visible = false
			
				if indexmeteor > 6:
					indexmeteor = 0
				
				pos = m_children[indexmeteor]
				child = coord_sprites[pos]
				child.visible = true
				play()
				indexmeteor += 1
			elif indexmeteor == 0:
				pos = m_children[indexmeteor]
				child = coord_sprites[pos]
				child.visible = true
				indexmeteor += 1
			time = 0