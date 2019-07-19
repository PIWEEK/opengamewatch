extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var speed = 0.9
var offset = 0.9
var delay = 0.9

var pos = [0,0]
var coord_sprites
var m_children
var t
var tend

var m3_1
var m3_2
var m3_3
var m3_4
var m3_5
var m3_6
var m3_7

var time
var indexmeteor
var child


func play():
	get_node("mmove").play()


# Called when the node enters the scene tree for the first time.
func _ready():

	m3_1 = get_node("m3_1")
	m3_2 = get_node("m3_2")
	m3_3 = get_node("m3_3")
	m3_4 = get_node("m3_4")
	m3_5 = get_node("m3_5")
	m3_6 = get_node("m3_6")

	coord_sprites = {[3,1]: m3_1, [3,2]: m3_2, [3,3]: m3_3, [3,4]: m3_4, [3,5]: m3_5, [3,6]: m3_6}
	
	m_children = [[3,1],[3,2],[3,3],[3,4],[3,5],[3,6]]

	time = 0
	indexmeteor = 0
	pos = [3,1]
	child = coord_sprites[pos]
	child.visible = true

var pause = false
func pause(delta):
	pause = true
	
func resume(delta):
	pause = false

func _process(delta):
	if not pause:
		time += delta
		if time > delay:
			
			if time > speed:
				if indexmeteor != 0:
					pos = m_children[indexmeteor-1]
					child = coord_sprites[pos]
					child.visible = false
				
					if indexmeteor > 5:
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