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
var t


# Called when the node enters the scene tree for the first time.
func _ready():
	meteor1 = get_node("Meteor01")
	meteor2 = get_node("Meteor02")
	


#	flagizq = get_node("flags").get_node("flagL")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _process(delta):
	t = Timer.new()
	t.set_wait_time(5.5)
	add_child(t)
	t.start()
	yield(t, "timeout")
	meteor1.visible = true
    
	#process_meteor1(delta)
	

