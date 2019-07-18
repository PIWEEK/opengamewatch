extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var activated = false
var initial = true

func visible(delta):
	if initial:
		get_node("antenna").visible = true
		get_node("leverup").visible = true
	initial = false

func action(delta):
	get_node("hand_up").visible=true
	var t = Timer.new() 		# Create a new Timer node
	t.set_wait_time(0.4) 		# Set the wait time
	add_child(t)			# Add it to the node tree as the direct child
	t.start()
	yield(t, "timeout")		# Finally, make the script stop with the yield
	get_node("hand_up").visible=false
	get_node("leverup").visible = false

	get_node("hand_down").visible=true
	get_node("leverup2").visible = true
	t.start()
	yield(t, "timeout")		# Finally, make the script stop with the yield
	get_node("hand_up").visible=false

	get_node("hand_down").visible=false
	t.start()
	yield(t, "timeout")		# Finally, make the script stop with the yield
	get_node("radio1").visible=true

	
	activated = true
	initial = false
	
	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
