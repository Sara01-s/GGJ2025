extends Node2D


@onready var sadako_idle: Sprite2D = $SadakoIdle

const SamIdle = preload("res://Assets/Cliente/Sadako_Idle.png")
const SamAngry = preload("res://Assets/Cliente/Sadako_Angry.png")
const SamHappy = preload("res://Assets/Cliente/Sadako_Happy.png")

signal dañarPersonaje
signal personajeHappy

@onready var timer = get_node("Timer")
@onready var pb = get_node("TextureProgressBar")

func _ready():
	timer.wait_time = pb.value

func _process(delta):
	#print(timer.time_left)
	pb.value = timer.time_left
	var dañar = Input.is_action_just_pressed("RestarVida")
	var happy = Input.is_action_just_pressed("OrderCorrect")
	if dañar:
		sadako_idle.texture = SamAngry
		dañarPersonaje.emit()
	if happy:
		sadako_idle.texture = SamHappy
		personajeHappy.emit()
		
	
	
func damage():
	var dañar = Input.is_action_just_pressed("RestarVida")
	if dañar:
		sadako_idle.texture = SamAngry
		dañarPersonaje.emit()
		
