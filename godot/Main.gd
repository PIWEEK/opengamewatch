extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const ASTRO_SPEED = 100

var dude
var meteor1
var meteor2
var meteor3
var meteor4
var meteor5

var ml1list

var flag


# Called when the node enters the scene tree for the first time.
func _ready():
	ml1list = []
	add_meteorline1(400,300)
	add_meteorline1(500,300)
	add_meteorline1(600,300)
	add_meteorline1(700,300)
	add_meteorline1(800,300)

#	flagizq = get_node("flags").get_node("flagL")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _process(delta):
	process_player_input(delta)
	#process_meteor1(delta)
	

func add_meteorline1(x, y):
	var m = load("res://Meteor01.tscn").instance()
	var ml1 = m.get_node("Sprite").duplicate()
	ml1.position.x = x
	ml1.position.y = y
	ml1list.append(ml1)
	add_child(ml1)

func create_meteor1():
	pass

func process_player_input(delta):
	pass