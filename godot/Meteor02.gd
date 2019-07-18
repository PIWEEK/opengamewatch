extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var speed = 2
var offset = 0.1
var delay = 100

var pos = [0,0]
var coord_sprites


# Called when the node enters the scene tree for the first time.
func _ready():

	var m2_1 = get_node("m2_1")
	var m2_2 = get_node("m2_2")
	var m2_3 = get_node("m2_3")
	var m2_4 = get_node("m2_4")
	var m2_5 = get_node("m2_5")
	var m2_6 = get_node("m2_6")
	var m2_7 = get_node("m2_7")

	coord_sprites = {[2,1]: m2_1, [2,2]: m2_2, [2,3]: m2_3, [2,4]: m2_4, [2,5]: m2_5, [2,6]: m2_6, [2,7]: m2_7}
	
	var m_children = [[2,7],[2,6],[2,5],[2,4],[2,3],[2,2],[2,1]]

	
	var t = Timer.new() 		# Create a new Timer node
	t.set_wait_time(speed+offset) 		# Set the wait time
	add_child(t)			# Add it to the node tree as the direct child

	var tend = Timer.new() 		# Create a new Timer node
	tend.set_wait_time(delay*3) 		# Set the wait time
	add_child(tend)			# Add it to the node tree as the direct child

	

	while true:
		for m in m_children:
			pos = m
			var child = coord_sprites[m]
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
