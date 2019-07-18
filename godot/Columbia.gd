extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	var c_children = get_children()

	var t = Timer.new() 		# Create a new Timer node
	t.set_wait_time(1) 		# Set the wait time
	add_child(t)			# Add it to the node tree as the direct child

	var tend = Timer.new() 		# Create a new Timer node
	tend.set_wait_time(3) 		# Set the wait time
	add_child(tend)			# Add it to the node tree as the direct child

#	if not right:
#		c_children.invert()

	while true:
		for child in c_children:
			child.visible = true
			t.start()			# Start it
			yield(t, "timeout")		# Finally, make the script stop with the yield
			child.visible = false
		tend.start()			# Start it
		yield(tend, "timeout")		# Finally, make the script stop with the yield
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
