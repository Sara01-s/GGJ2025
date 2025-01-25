extends Node2D

signal player_life_updated(player_life)
@export var player_life = 3

func _ready() -> void:
		pass

func game_over():
	print("Moriste hijupe")
	get_tree().change_scene_to_file("res://Desvivido.tscn")

func _on_cliente_dañar_personaje() -> void:
	player_life -= 1
	print(player_life, " has recibido daño")
	player_life_updated.emit()
	if player_life <= 0:
		game_over()
		
## Manager que instancia clientes
