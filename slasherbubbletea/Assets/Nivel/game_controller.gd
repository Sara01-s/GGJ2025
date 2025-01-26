extends Node2D

signal player_life_updated(player_life)
@export var player_life = 3

#Funcion que es ejecutada al inicio del programa
func _ready() -> void:
	pass

func game_over():
	get_tree().change_scene_to_file("res://Desvivido.tscn")

func _on_cliente_dañar_personaje() -> void:
	player_life -= 1
	player_life_updated.emit(player_life)
	if player_life <= 0:
		game_over()
		
## Manager que instancia clientes

func _on_vaso_logic_pedido_equivocado(vidas: Variant) -> void:
	player_life -= 1
	print(player_life, " has recibido daño")
	#get_node_or_null("./Control").get_child(4)._on_game_controller_player_life_updated(player_life)
	player_life_updated.emit(player_life)
	if player_life <= 0:
		game_over()
