extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var pos = [0,0]
var coord_sprites
var legal_coord_sprites
var startpos = [1,1]

var houston = false
var moonbaseavail = false
var moonbase = 0


var deaddude = false
var dude_is_dead_by_fall = false
var dude_is_dead_by_meteor = false

var dude_can_call_houston = false
var dude_can_walk_moon = false
var small_step = false
var moon_base_coord = [0,0]
var moon_flag_destiny = [99,99]

var parent

func touchdown(coord):
	moon_base_coord = coord
	dude_can_walk_moon = true
	
var pause = false
func pause(delta):
	pause = true
	var t = Timer.new() 		# Create a new Timer node
	t.set_wait_time(0.25) 		# Set the wait time
	add_child(t)			# Add it to the node tree as the direct child
	
	
	for i in range(5):
		draw_dude(startpos)
	
		t.start()			# Start it
		yield(t, "timeout")		# Finally, make the script stop with the yield
		hide_dude(startpos)
		t.start()			# Start it
		yield(t, "timeout")		# Finally, make the script stop with the yield
	draw_dude(startpos)
	
	
		

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
	coord_sprites = {[1,1]: d1_1, [1,2]: d1_2, [1,3]: d1_3, [1,4]: d1_4, [1,5]: d1_5, [1,6]: d1_6,# [1,7]: d1_7,
	[2,2]: d2_2, [2,3]: d2_3, [2,4]: d2_4, [2,5]: d2_5, [2,6]: d2_6, 
	[3,2]: d3_2, [3,3]: d3_3, [3,4]: d3_4, [3,5]: d3_5, [3,6]: d3_6,
	[4,2]: d4_2, [4,3]: d4_3, [4,4]: d4_4, [4,5]: d4_5, [4,6]: d4_6,
	[5,2]: d5_2, [5,3]: d5_3, [5,4]: d5_4, [5,5]: d5_5, [5,6]: d5_6,}
	
	legal_coord_sprites = [[1,2], [1,3], [1,4], [1,5], [1,6],
	[2,2], [2,3], [2,4], [2,5], [2,6], 
	[3,2], [3,3], [3,4], [3,5], [3,6],
	[4,2], [4,3], [4,4], [4,5], [4,6]]
	
	var t = Timer.new() 		# Create a new Timer node
	t.set_wait_time(1) 		# Set the wait time
	add_child(t)			# Add it to the node tree as the direct child
	t.start()			# Start it
	yield(t, "timeout")		# Finally, make the script stop with the yield
	
	hide_dude(startpos)
	startpos = go_right(startpos, 0)
	
	draw_dude(startpos)


func dead_by_fall():
	dude_is_dead_by_fall = true
	deaddude = true

func dead_by_meteor():
	dude_is_dead_by_meteor = true
	get_node("dead").play()
	deaddude = true


func resuscitate():
	deaddude = false

func checkforflag(pos):
	if parent.flag_coord == pos:
		parent.flag_is_taken = true

func go_right(startpos, delta):
	var startdude = coord_sprites[startpos]
	var row = startpos[0]
	var col = startpos[1]
	get_node("move").play()
	if next_move_exists([row, col+1]):
		var newdude = coord_sprites[[row,col+1]]
		currentdeltaforgravity = 0
		var newpos = [row,col+1]
		checkforflag(newpos)
		return newpos
	else:
		if dude_can_call_houston:
			if (row == 3 and col == 6):
				parent.show_base = true
				
				get_node("call").play()		
				
				dude_can_call_houston = false		
			
		currentdeltaforgravity += delta
		var newdude = coord_sprites[[row,col]]
		return [row,col]
	
func go_left(startpos, delta):
	var startdude = coord_sprites[startpos]
	var row = startpos[0]
	var col = startpos[1]
	get_node("move").play()
	if next_move_exists([row, col-1]) and next_move_is_valid(([row, col-1])):
		var newdude = coord_sprites[[row,col-1]]
		currentdeltaforgravity = 0
		var newpos = [row,col-1]
		checkforflag(newpos)
		return newpos
	else:
		currentdeltaforgravity += delta

		var newdude = coord_sprites[[row,col]]
		return [row,col]
	
func jump(startpos):
	var startdude = coord_sprites[startpos]
	var row = startpos[0]
	var col = startpos[1]
	get_node("move").play()
	if next_move_exists([row-1, col]):
		var newdude = coord_sprites[[row-1,col]]
		currentdeltaforgravity = 0
		return [row-1,col]
	else:
		var newdude = coord_sprites[[row,col]]
		return [row,col]
	

func go_down(startpos):	
	var startdude = coord_sprites[startpos]
	var row = startpos[0]
	var col = startpos[1]
	get_node("move").play()
	if next_move_exists([row+1, col]):
		var newdude = coord_sprites[[row+1,col]]
		currentdeltaforgravity = 0
		var newpos = [row+1,col]
		checkforflag(newpos)
		if not next_move_is_valid([row+1, col]):
			dead_by_fall()
	

	return [row+1,col]

func draw_dude(pos):
	var dude_to_draw = coord_sprites[pos]
	dude_to_draw.visible = true

func hide_dude(pos):
	var dude_to_hide = coord_sprites[pos]
	dude_to_hide.visible = false
	
func next_move_is_valid(newpos):
	if newpos in legal_coord_sprites:
		return true
	else:
		return false

	
func next_move_exists(newpos):
	if newpos in coord_sprites:
		return true
	else:
		return false


var maxdeltaforgravity = 1.0
var currentdeltaforgravity = 0

func _process(delta):
	if not pause:
		if not deaddude:
			currentdeltaforgravity += delta
			
			if Input.is_action_just_released("ui_right"):
				hide_dude(startpos)
				startpos = go_right(startpos, delta)
				draw_dude(startpos)
				
			elif Input.is_action_just_released("ui_left"):
				hide_dude(startpos)
				startpos = go_left(startpos, delta)
				draw_dude(startpos)	
	
			elif Input.is_action_just_released("ui_accept"):
				hide_dude(startpos)
				startpos = jump(startpos)
				draw_dude(startpos)
				currentdeltaforgravity = 0
	#		elif Input.is_action_just_released("ui_down"):
	#			hide_dude(startpos)
	#			startpos = go_down(startpos)
	#			draw_dude(startpos)
	#			currentdeltaforgravity = 0
			if currentdeltaforgravity >= maxdeltaforgravity:
				if startpos[0] < 5:
	#			if (not dude_can_walk_moon) and (startpos[0] < 6):
					hide_dude(startpos)
					startpos = go_down(startpos)
					draw_dude(startpos)
					currentdeltaforgravity = 0
		else:
			pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
