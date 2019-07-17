extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var ml1list

# Called when the node enters the scene tree for the first time.
func _ready():
	ml1list = []
	add_meteorline1(400,300)
	add_meteorline1(500,300)
	add_meteorline1(600,300)
	add_meteorline1(700,300)
	add_meteorline1(800,300)
	add_meteorline1(900,300)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func add_meteorline1(x, y):
	var ml1 = get_node("Sprite").duplicate()
	ml1.position.x = x
	ml1.position.y = y
	ml1list.append(ml1)
	add_child(ml1)