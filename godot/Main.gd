extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const ASTRO_SPEED = 5

var astronaut

# Called when the node enters the scene tree for the first time.
func _ready():
	astronaut = get_node("astrodude")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _process(delta):
	process_player_input(delta)


func process_player_input(delta):
	if Input.is_action_pressed("ui_right"):
		astronaut.dude.position.x += ASTRO_SPEED
		if astronaut.dude.position.x >=500:
			astronaut.dude.position.x = 500
	elif Input.is_action_pressed("ui_left"):
		astronaut.position.x -= ASTRO_SPEED 
		if astronaut.position.x <=0:
			astronaut.position.x = 0
	elif Input.is_action_pressed("ui_up"):		
		astronaut.position.y -= ASTRO_SPEED
		if astronaut.position.y <= 0:
			astronaut.position.y = 0
	elif Input.is_action_pressed("ui_down"):		
		astronaut.position.y += ASTRO_SPEED
		if astronaut.position.y >= 300:
			astronaut.position.y = 300
