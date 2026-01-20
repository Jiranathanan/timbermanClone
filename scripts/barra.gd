extends Node2D

# marcador (scorekeeper)
onready var marc = get_node("Marcador")
# perc (percentage)
var perc = 1

# signal lost
signal perdeu

func _ready():
	set_process(true)
	
func _process(delta):
	if perc > 0: # which means that we didn't lose
		# we'll decrease the bar
		perc -= 0.1*delta
		marc.set_region_rect(Rect2(0, 0, perc*188, 23))
		marc.set_pos(Vector2(-(1-perc)*188/2, 0))
	else:
		emit_signal("perdeu")
		
func add(delta):
	perc += delta
	if perc > 1: perc = 1
	
