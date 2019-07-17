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
	meteoranim(meteor1, 1, 0, true)
	meteoranim(meteor2, 1, 0.1, false)
	meteoranim(meteor3, 1, 0.3, true)
	meteoranim(meteor4, 1, 0.5, false)
	meteoranim(meteor5, 1, 0.1, true)
	
	Columb = get_node("Columbia")
	columbanim(Columb, 1, 0, true)
	


func _process(delta):
	pass


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
