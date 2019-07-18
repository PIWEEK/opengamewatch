extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var counter = 0
var box
var lever_up
var line1
var line2
var line3

# Called when the node enters the scene tree for the first time.
func _ready():
	box = get_node("antenna")
	box.visible = true
	lever_up = get_node("leverup")
	lever_up.visible = true
	line1 = get_node("radio1")
	line2 = get_node("radio2")
	line3 = get_node("radio3")


func _process(delta):
	

	if Input.is_action_just_released("ui_up"):
		if counter == 0:
			line1.visible = true
			counter = 1
		elif counter == 1:
			line2.visible = true
			counter = 2
		elif counter == 2: 
			line3.visible = true
			counter = 3

	if Input.is_action_just_released("ui_down"):
		if counter == 3:
			line3.visible = false
			counter = 2
		elif counter == 2:
			line2.visible = false
			counter = 1
		elif counter == 1:
			line1.visible = false
			counter = 0
