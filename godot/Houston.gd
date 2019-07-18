extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var counter = 0
var box
var lever_up
var lever_down
var hand_up
var hand_down
var line1
var line2
var line3
var num_lines

# Called when the node enters the scene tree for the first time.
func _ready():
	box = get_node("antenna")
	lever_up = get_node("leverup")
	lever_down = get_node("leverdown")
	hand_up = get_node("handup")
	hand_down = get_node("handdown")
	line1 = get_node("radio1")
	line2 = get_node("radio2")
	line3 = get_node("radio3")
	box.visible = true
	lever_up.visible = true
	lever_down.visible = false
	hand_up.visible = false
	hand_down.visible = false


func pintalineas(num_lines):
	
	if num_lines == 1:
		line1.visible = true
		line2.visible = false
		line3.visible = false
	elif num_lines == 2:
		line1.visible = true
		line2.visible = true	
		line3.visible = false
	elif num_lines == 3:
		line1.visible = true
		line2.visible = true
		line3.visible = true
	elif num_lines == 0:
		line1.visible = false
		line2.visible = false
		line3.visible = false		
		
func levermoving(pos):
	
	if pos == 1:
		hand_up.visible = false
		lever_up.visible = true
		lever_down.visible = false
		hand_down.visible = false
	elif pos == 2:
		hand_up.visible = true
		lever_up.visible = true
		lever_down.visible = false
		hand_down.visible = false
	elif pos == 3:
		hand_up.visible = false
		lever_up.visible = false
		lever_down.visible = true
		hand_down.visible = true
	elif pos == 4:
		hand_up.visible = false
		lever_up.visible = false
		lever_down.visible = true
		hand_down.visible = false
	
func _process(delta):
	
	if Input.is_action_just_released("ui_left"):
		pintalineas(1)
	elif Input.is_action_just_released("ui_up"):
		pintalineas(2)
	elif Input.is_action_just_released("ui_right"):
		pintalineas(3)
	elif Input.is_action_just_released("ui_down"):
		pintalineas(0)
		
	
	if Input.is_action_just_released("ui_select"):
		levermoving(1)
	if Input.is_action_just_released("ui_page_down"):
		levermoving(2)
	if Input.is_action_just_released("ui_page_up"):
		levermoving(3)
	if Input.is_action_just_released("ui_m"):
		levermoving(4)
	
#	if Input.is_action_just_released("ui_up"):
#		if counter == 0:
#			line1.visible = true
#			counter = 1
#		elif counter == 1:
#			line2.visible = true
#			counter = 2
#		elif counter == 2: 
#			line3.visible = true
#			counter = 3
#
#	if Input.is_action_just_released("ui_down"):
#		if counter == 3:
#			line3.visible = false
#			counter = 2
#		elif counter == 2:
#			line2.visible = false
#			counter = 1
#		elif counter == 1:
#			line1.visible = false
#			counter = 0


		