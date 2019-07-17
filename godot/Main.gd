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


#	flagizq = get_node("flags").get_node("flagL")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _process(delta):
	process_player_input(delta)
	#process_meteor1(delta)
	


func create_meteor1():
	pass

func process_player_input(delta):
	pass