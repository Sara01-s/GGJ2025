extends Node3D
@onready var sadako_idle: Sprite3D = $SadakoIdle

const SamIdle = preload("res://Assets/Cliente/Sadako_Idle.png")
const SamAngry = preload("res://Assets/Cliente3D/SADAKO_IDLE_ANGRY.png")
const SamHappy = preload("res://Assets/Cliente3D/Sadako_Happy.png")

signal dañarPersonaje
signal personajeHappy
signal uiUpdate(playerhealthlife)

@onready var paciencia: TextureProgressBar = $Node3D/SubViewport/Paciencia

@onready var timer = get_node("Timer3D")


func _process(delta):
	paciencia.value = timer.time_left
	var dañar = Input.is_action_just_pressed("RestarVida")
	var happy = Input.is_action_just_pressed("OrderCorrect")
	if dañar:
		sadako_idle.texture = SamAngry
		print("dañado")
		dañarPersonaje.emit()
	if happy:
		sadako_idle.texture = SamHappy
		print("ordenRecibida")
		personajeHappy.emit()
		

func _on_timer_3d_timeout() -> void:
	print("Tiempo acabado")
	dañarPersonaje.emit()
	sadako_idle.texture = SamAngry
	timer.start()

func _on_controlador_player_life_updated(player_life: Variant) -> void:
	uiUpdate.emit(player_life)
