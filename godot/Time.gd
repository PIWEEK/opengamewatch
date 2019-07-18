extends Node2D

var s1_2
var s1_3
var s2_1
var s2_2
var s2_3
var s2_4
var s2_5
var s2_6
var s2_7
var s3_1
var s3_2
var s3_3
var s3_4
var s3_5
var s3_6
var s3_7
var s4_1
var s4_2
var s4_3
var s4_4
var s4_5
var s4_6
var s4_7
var alarm_1
var alarm_2
var time = 0
var colonblink



# Called when the node enters the scene tree for the first time.
func _ready():
	
	s1_2 = get_node("segment1_2")
	s1_3 = get_node("segment1_3")
	s2_1 = get_node("segment2_1")
	s2_2 = get_node("segment2_2")
	s2_3 = get_node("segment2_3")
	s2_4 = get_node("segment2_4")
	s2_5 = get_node("segment2_5")
	s2_6 = get_node("segment2_6")
	s2_7 = get_node("segment2_7")
	s3_1 = get_node("segment3_1")
	s3_2 = get_node("segment3_2")
	s3_3 = get_node("segment3_3")
	s3_4 = get_node("segment3_4")
	s3_5 = get_node("segment3_5")
	s3_6 = get_node("segment3_6")
	s3_7 = get_node("segment3_7")
	s4_1 = get_node("segment4_1")
	s4_2 = get_node("segment4_2")
	s4_3 = get_node("segment4_3")
	s4_4 = get_node("segment4_4")
	s4_5 = get_node("segment4_5")
	s4_6 = get_node("segment4_6")
	s4_7 = get_node("segment4_7")
	alarm_1 = get_node("alarm1")
	alarm_2 = get_node("alarm2")
	colonblink = get_node("colon")

	s1_2.visible = true
	s1_3.visible = true
	s2_1.visible = true
	s2_2.visible = true
	s2_3.visible = false
	s2_4.visible = true
	s2_5.visible = true
	s2_6.visible = false
	s2_7.visible = true
	s3_1.visible = true
	s3_2.visible = true
	s3_3.visible = true
	s3_4.visible = true
	s3_5.visible = false
	s3_6.visible = false
	s3_7.visible = true
	s4_1.visible = true
	s4_2.visible = false
	s4_3.visible = true
	s4_4.visible = true
	s4_5.visible = false
	s4_6.visible = true
	s4_7.visible = true
	alarm_1.visible = false
	alarm_2.visible = true
	colonblink.visible = true
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	time = time+delta
		
	if time > 0.5:
		if colonblink.visible == false:
			colonblink.visible = true
		else:
			colonblink.visible = false
		
		time = 0
	
		
	
		

	
	
	
	
	
	