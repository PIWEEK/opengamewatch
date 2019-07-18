extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var counter
var box
var lever_up

# Called when the node enters the scene tree for the first time.
func _ready():
	box = get_node("antenna")
	box.visible = true
	lever_up = get_node("leverup")
	lever_up.visible = true


func _process(delta):
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
