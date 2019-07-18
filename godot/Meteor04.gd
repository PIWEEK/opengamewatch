extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var speed = 0.5
var offset = 0.1
var delay = 1

var pos = [0,0]
var coord_sprites
var m_children
var t
var tend

var m4_1
var m4_2
var m4_3
var m4_4
var m4_5
var m4_6
var m4_7

var time
var indexmeteor
var child

# Called when the node enters the scene tree for the first time.
func _ready():

	m4_1 = get_node("m4_1")
	m4_2 = get_node("m4_2")
	m4_3 = get_node("m4_3")
	m4_4 = get_node("m4_4")
	m4_5 = get_node("m4_5")
	m4_6 = get_node("m4_6")
	m4_7 = get_node("m4_7")

	coord_sprites = {[4,1]: m4_1, [4,2]: m4_2, [4,3]: m4_3, [4,4]: m4_4, [4,5]: m4_5, [4,6]: m4_6, [4,7]: m4_7}
	
	m_children = [[4,7],[4,6],[4,5],[4,4],[4,3],[4,2],[4,1]]

	time = 0
	indexmeteor = 0
	pos = [0,0]
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	if time > delay:
		
		if time > speed:
			pos = m_children[indexmeteor]
			child = coord_sprites[pos]
			child.visible = false
			indexmeteor += 1
			if indexmeteor > 6:
				indexmeteor = 0
			time = 0
			pos = m_children[indexmeteor]
			child = coord_sprites[pos]
			child.visible = true
					
