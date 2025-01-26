extends Node3D
@onready var sadako_idle: Sprite3D = $SadakoIdle


const SamIdle = preload("res://Assets/Cliente/Sadako_Idle.png")
const SamAngry = preload("res://Assets/Cliente3D/SADAKO_IDLE_ANGRY.png")
const SamHappy = preload("res://Assets/Cliente3D/Sadako_Happy.png")

signal reiniciarTimer

@onready var paciencia: TextureProgressBar = $Node3D/SubViewport/Paciencia

@onready var timer = get_node("Timer3D")

func _ready() -> void:
	print("llego cliente")
	#get_node_or_null("../../Control").get_child(4)._on_game_controller_player_life_updated(player_life)
	
func _process(delta):
	paciencia.value = timer.time_left
	var dañar = Input.is_action_just_pressed("RestarVida")
	var happy = Input.is_action_just_pressed("OrderCorrect")
	if dañar:
		sadako_idle.texture = SamAngry
		print("dañado")
		get_node_or_null("../GameController")._on_cliente_dañar_personaje()
		get_node_or_null("../ClienteSpawner")._on_cliente_personaje_happy()
		queue_free()
		timer.start()
	if happy:
		sadako_idle.texture = SamHappy
		get_node_or_null("../ClienteSpawner")._on_cliente_personaje_happy()
		queue_free()
		timer.start()

func _on_timer_3d_timeout() -> void:
	print("Tiempo acabado")
	get_node_or_null("../ClienteSpawner")._on_cliente_personaje_happy()
	get_node_or_null("../GameController")._on_cliente_dañar_personaje()
	sadako_idle.texture = SamAngry
	queue_free()
	timer.start()
