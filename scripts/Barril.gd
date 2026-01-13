extends Node2D


func _ready():
	pass

func dest(sent): #dest destroy , sent direction
	# if sent == -1 means player touch on the left of the screen
	if sent == -1:
		get_node("AnimationPlayer").play("direita")
	else:
		get_node("AnimationPlayer").play("esquerda")