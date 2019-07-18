extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var speed = 1
var offset = 0.3
var delay = 3

var pos = [0,0]
var coord_sprites
var m_children
var t
var tend

var time
var indexmeteor
var child

# Called when the node enters the scene tree for the first time.
func _ready():

	var m1_1 = get_node("m1_1")
	var m1_2 = get_node("m1_2")
	var m1_3 = get_node("m1_3")
	var m1_4 = get_node("m1_4")
	var m1_5 = get_node("m1_5")
	var m1_6 = get_node("m1_6")
	var m1_7 = get_node("m1_7")

	coord_sprites = {[1,1]: m1_1, [1,2]: m1_2, [1,3]: m1_3, [1,4]: m1_4, [1,5]: m1_5, [1,6]: m1_6, [1,7]: m1_7}
	
	m_children = [[1,7],[1,6],[1,5],[1,4],[1,3],[1,2],[1,1]]
	m_children.invert()

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
					
