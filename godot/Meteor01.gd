extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var speed = 2
var offset = 0.1
var delay = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	
	var m_children = get_children()


	var t = Timer.new() 		# Create a new Timer node
	t.set_wait_time(speed+offset) 		# Set the wait time
	add_child(t)			# Add it to the node tree as the direct child

	var tend = Timer.new() 		# Create a new Timer node
	tend.set_wait_time(delay*3) 		# Set the wait time
	add_child(tend)			# Add it to the node tree as the direct child

	

	while true:
		for child in m_children:
			child.visible = true
			t.start()			# Start it
			yield(t, "timeout")		# Finally, make the script stop with the yield
			child.visible = false
		tend.start()			# Start it
		yield(tend, "timeout")		# Finally, make the script stop with the yield
		print("en el while")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
