extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var pos = [0,0]
var coord_sprites
var startpos = [1,1]



func move(row,col,direction):
	if direction == "jump":
		row += 1
	elif direction == "down":
		row -= 1
	elif direction == "left":
		col -= 1
	elif direction == "right":
		col += 1	
	return [row,col]	


# Called when the node enters the scene tree for the first time.
func _ready():
	var d1_1 = get_node("1_1")
	var d1_2 = get_node("1_2")
	var d1_3 = get_node("1_3")
	var d1_4 = get_node("1_4")
	var d1_5 = get_node("1_5")
	var d1_6 = get_node("1_6")
	var d1_7 = get_node("1_7")
	var d2_2 = get_node("2_2")
	var d2_3 = get_node("2_3")
	var d2_4 = get_node("2_4")
	var d2_5 = get_node("2_5")
	var d2_6 = get_node("2_6")
	var d3_2 = get_node("3_2")
	var d3_3 = get_node("3_3")
	var d3_4 = get_node("3_4")
	var d3_5 = get_node("3_5")
	var d3_6 = get_node("3_6")
	var d4_2 = get_node("4_2")
	var d4_3 = get_node("4_3")
	var d4_4 = get_node("4_4")
	var d4_5 = get_node("4_5")
	var d4_6 = get_node("4_6")
	var d5_2 = get_node("5_2")
	var d5_3 = get_node("5_3")
	var d5_4 = get_node("5_4")
	var d5_5 = get_node("5_5")
	var d5_6 = get_node("5_6")


	d1_1.visible = true
	coord_sprites = {[1,1]: d1_1, [1,2]: d1_2, [1,3]: d1_3}
	


func go_right(startpos):
	var startdude = coord_sprites[startpos]
	var row = startpos[0]
	var col = startpos[1]
	var newdude = coord_sprites[[row,col+1]]
	
	return [row,col+1]
	
func go_left(startpos):
	pass
	
func jump(startpos):
	pass	
	

func go_down(startpos):	
	pass
	
func _process(delta):
	
	if Input.is_action_just_released("ui_right"):
		startpos = go_right(startpos)
		print(startpos)
	elif Input.is_action_just_released("ui_left"):
		go_left(startpos)
	elif Input.is_action_pressed("ui_accept"):
		jump(startpos)
	elif Input.is_action_pressed("ui_down"):
		go_down(startpos)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
