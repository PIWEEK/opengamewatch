extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	var deadsprite = get_node("deaddude")
	var miss1 = get_node("miss1")

	var t = Timer.new() 		# Create a new Timer node
	t.set_wait_time(0.25) 		# Set the wait time
	add_child(t)			# Add it to the node tree as the direct child
		
	for i in range(5):
		deadsprite.visible = true	
		miss1.visible = true	
		t.start()			# Start it
		yield(t, "timeout")		# Finally, make the script stop with the yield
		deadsprite.visible = false
		miss1.visible = false	
		t.start()			# Start it
		yield(t, "timeout")		# Finally, make the script stop with the yield
		
	deadsprite.visible = true
	miss1.visible = true	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
