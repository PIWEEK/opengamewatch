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
	meteoranim(meteor1, 1, 0, true)
	meteoranim(meteor2, 1, 0.1, false)


#	flagizq = get_node("flags").get_node("flagL")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _process(delta):
	pass


#	meteoranim(meteor2, 3)

    
	#process_meteor1(delta)
	

func meteoranim(meteor, delay, offset, right):

	var m_children = meteor.get_children()
	if not right:
		m_children.invert()

	while true:
		for child in m_children:
			child.visible = true
			var t = Timer.new() 		# Create a new Timer node
		
			t.set_wait_time(delay+offset) 		# Set the wait time
			add_child(t)			# Add it to the node tree as the direct child
			t.start()			# Start it
			yield(t, "timeout")		# Finally, make the script stop with the yield
			child.visible = false
		var t = Timer.new() 		# Create a new Timer node
		
		t.set_wait_time(delay*3) 		# Set the wait time
		add_child(t)			# Add it to the node tree as the direct child
		t.start()			# Start it
		yield(t, "timeout")		# Finally, make the script stop with the yield

