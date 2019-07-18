extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var pos = 0

func generate_base():
	var bases = get_children()
	bases.shuffle()
	return bases[0]



# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var newbase = generate_base()
	newbase.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
