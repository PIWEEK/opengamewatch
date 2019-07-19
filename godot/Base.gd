extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var pos = 0
var wehavebase = false
var coord_base = [5,1]
var b1
var b2
var b3
var b4
var b5
var flagL
var flagR

var bases_coord
var flag_coord
var c
var b

func generate_all_bases():
	b1.visible = true
	b2.visible = true
	b3.visible = true
	b4.visible = true
	b5.visible = true
	
	return bases_coord.keys()



func blinkflag(flag):

	var t = Timer.new() 		# Create a new Timer node
	t.set_wait_time(0.25) 		# Set the wait time
	add_child(t)			# Add it to the node tree as the direct child
	
	while blink:
		flag.visible = true
		t.start()			# Start it
		yield(t, "timeout")		# Finally, make the script stop with the yield
		flag.visible = false
		t.start()			# Start it
		yield(t, "timeout")		# Finally, make the script stop with the yield
	flag.visible = true

	
var blink = false

func make_flag_appear():

	blink = true
	if c[1] < 4:
		flagR.visible = true
		flag_coord = [5,6]
		blinkflag(flagR)
	if c[1] >= 4:
		flagL.visible = true
		flag_coord = [5,2]
		blinkflag(flagL)
		
	return flag_coord
	
func generate_base():
	if not wehavebase:
		randomize()
		var coords = bases_coord.keys()
		coords.shuffle()
		c = coords[0]
		b = bases_coord[c]
		b.visible = true
		wehavebase = true
		return c
	

# Called when the node enters the scene tree for the first time.
func _ready():

	b1 = get_node("base1")
	b2 = get_node("base2")
	b3 = get_node("base3")
	b4 = get_node("base4")
	b5 = get_node("base5")
	flagL = get_node("flagL")
	flagR = get_node("flagR")
	
	bases_coord = {[5,2]:b1,[5,3]:b2,[5,4]:b3,[5,5]:b4,[5,6]:b5}

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
