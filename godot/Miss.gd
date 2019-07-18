extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var head_1
var head_2
var head_3

# Called when the node enters the scene tree for the first time.
func _ready():
	
	head_1 = get_node("head1")
	head_2 = get_node("head2")
	head_3 = get_node("head3")
	head_1.visible = false
	head_2.visible = false
	head_3.visible = false


func pintamiss(set):
	
	if set == 1:
		head_1.visible = false
		head_2.visible = false
		head_3.visible = false
	elif set == 2:
		head_1.visible = true
		head_2.visible = false
		head_3.visible = false
	elif set == 3:
		head_1.visible = true
		head_2.visible = true
		head_3.visible = false
	elif set == 4:
		head_1.visible = true
		head_2.visible = true
		head_3.visible = true
		
	
func _process(delta):
	
	if Input.is_action_just_released("ui_left"):
		pintamiss(1)
	elif Input.is_action_just_released("ui_up"):
		pintamiss(2)
	elif Input.is_action_just_released("ui_right"):
		pintamiss(3)
	elif Input.is_action_just_released("ui_down"):
		pintamiss(4)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
