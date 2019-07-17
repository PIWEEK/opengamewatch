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
var Columb


# Called when the node enters the scene tree for the first time.

func _ready():
	meteor1 = get_node("Meteor01")
	meteor2 = get_node("Meteor02")
	meteor3 = get_node("Meteor03")
	meteor4 = get_node("Meteor04")
	meteor5 = get_node("Meteor05")
#	meteoranim(meteor1, 1, 0, true)
#	meteoranim(meteor2, 1, 0.1, false)
	meteoranim(meteor3, 1, 0.3, true)
	meteoranim(meteor4, 1, 0.5, false)
	meteoranim(meteor5, 1, 0.1, true)
	
	Columb = get_node("Columbia")
	columbanim(Columb, 1, 0, true)
	#load_dude()
	

func meteor_kills_dude(dudepos, listofmeteorpos):
	for mpos in listofmeteorpos:
		if dudepos == mpos:
			return true
	return false

var currentdudepos = [0,0]

var number_of_misses = 0
var endgame = false

const DUDE_SCENE = preload("res://Dude.tscn")

func load_dude():
	var new_dude_scene = DUDE_SCENE.instance()
	new_dude_scene.position.x = 346
	new_dude_scene.position.y = 200
    #Must have unique nodepath
    #Might be done automatically, but just in case
	new_dude_scene.set_name("Dude")
	add_child(new_dude_scene)

func _process(delta):
	if not endgame:
		var is_dude_dead = get_node("Dude").get("deaddude")
		if is_dude_dead:
			var t = Timer.new() 		# Create a new Timer node
			t.set_wait_time(3) 		# Set the wait time
			add_child(t)			# Add it to the node tree as the direct child
			t.start()			# Start it
			yield(t, "timeout")		# Finally, make the script stop with the yield
		if number_of_misses > 2:
			endgame = true
	
		currentdudepos = get_node("Dude").get("startpos")
		var meteor1pos = get_node("Meteor01").get("pos")
		var meteor2pos = get_node("Meteor02").get("pos")

		var listofmeteorpos = [meteor1pos, meteor2pos]
		if meteor_kills_dude(currentdudepos, listofmeteorpos):
			get_node("Dude").dead()
			print("MUERTE!")
			print(number_of_misses)
			var t = Timer.new() 		# Create a new Timer node
			t.set_wait_time(3) 		# Set the wait time
			add_child(t)			# Add it to the node tree as the direct child
			t.start()			# Start it
			yield(t, "timeout")		# Finally, make the script stop with the yield
			get_node("Dude").resuscitate()
			number_of_misses += 1
		
		#print(currentdudepos)



func meteoranim(meteor, delay, offset, right):

	var t = Timer.new() 		# Create a new Timer node
	t.set_wait_time(delay+offset) 		# Set the wait time
	add_child(t)			# Add it to the node tree as the direct child

	var tend = Timer.new() 		# Create a new Timer node
	tend.set_wait_time(delay*3) 		# Set the wait time
	add_child(tend)			# Add it to the node tree as the direct child

	var m_children = meteor.get_children()
	if not right:
		m_children.invert()

	while true:
		for child in m_children:
			child.visible = true
			t.start()			# Start it
			yield(t, "timeout")		# Finally, make the script stop with the yield
			child.visible = false
		tend.start()			# Start it
		yield(tend, "timeout")		# Finally, make the script stop with the yield
		

func columbanim(columb_unidad, delay, offset, right):

	var t = Timer.new() 		# Create a new Timer node
	t.set_wait_time(delay+offset) 		# Set the wait time
	add_child(t)			# Add it to the node tree as the direct child

	var tend = Timer.new() 		# Create a new Timer node
	tend.set_wait_time(delay*3) 		# Set the wait time
	add_child(tend)			# Add it to the node tree as the direct child

	var c_children = columb_unidad.get_children()
	if not right:
		c_children.invert()

	while true:
		for child in c_children:
			child.visible = true
			t.start()			# Start it
			yield(t, "timeout")		# Finally, make the script stop with the yield
			child.visible = false
		tend.start()			# Start it
		yield(tend, "timeout")		# Finally, make the script stop with the yield