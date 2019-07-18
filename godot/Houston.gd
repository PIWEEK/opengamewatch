extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func visible(delta):
	get_node("antenna").visible = true
	get_node("leverup").visible = true
	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
