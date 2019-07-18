extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var speed = 1.5
var offset = 1.5
var delay = 1.5

var pos = [0,0]
var coord_sprites
var m_children
var t
var tend

var m2_1
var m2_2
var m2_3
var m2_4
var m2_5
var m2_6
var m2_7

var time
var indexmeteor
var child

func play():
	get_node("mmove").play()


# Called when the node enters the scene tree for the first time.
func _ready():

	m2_1 = get_node("m2_1")
	m2_2 = get_node("m2_2")
	m2_3 = get_node("m2_3")
	m2_4 = get_node("m2_4")
	m2_5 = get_node("m2_5")
	m2_6 = get_node("m2_6")
	m2_7 = get_node("m2_7")

	coord_sprites = {[2,1]: m2_1, [2,2]: m2_2, [2,3]: m2_3, [2,4]: m2_4, [2,5]: m2_5, [2,6]: m2_6, [2,7]: m2_7}
	
	m_children = [[2,7],[2,6],[2,5],[2,4],[2,3],[2,2],[2,1]]

	time = 0
	indexmeteor = 0
	pos = [2,7]
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