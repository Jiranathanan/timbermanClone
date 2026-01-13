extends Node

var barril = preload("res://scenes/barril.tscn")
var barrilEsq = preload("res://scenes/barrilEsq.tscn")
var barrilDir = preload("res://scenes/barrilDir.tscn")

onready var felpudo = get_node("Felpudo")
onready var camera = get_node("Camera")
onready var barris = get_node("Barris")
onready var destbarris = get_node("DestBarris")

# ultini = last enemy which means if the last barrel had enemy or not
var ultini

func _ready():
	randomize()
	set_process_input(true)
	gerarIni()
	
func _input(event):
	event = camera.make_input_local(event)
	if event.type == InputEvent.SCREEN_TOUCH and event.pressed:
		
		if event.pos.x < 360:
			felpudo.esq()
		else:
			felpudo.dir()
		
		felpudo.bater()
		
# random barril
func aleaBarril(pos):
	var num = rand_range(0, 3)
	if ultini:	num = 0
	gerarBarril(int(num), pos)		
		
# generate barril
func gerarBarril(tipo, pos):
	var novo
	if tipo == 0:
		novo = barril.instance()
		ultini = false
	elif tipo == 1:
		novo = barrilEsq.instance()
		novo.add_to_group("barrilEsq")
		ultini = true
	elif tipo == 2:
		novo = barrilDir.instance()
		novo.add_to_group("barrilDir")
		ultini = true
	
	novo.set_pos(pos)
	barris.add_child(novo)
	
## generate the initial barrel
func gerarIni():
	for i in range(0, 3):
		gerarBarril(0, Vector2(360, 1090 - i*172))
		
	for i in range(3, 10):
		aleaBarril(Vector2(360, 1090 - i*172))
