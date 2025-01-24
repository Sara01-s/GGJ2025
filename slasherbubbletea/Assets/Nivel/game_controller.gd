extends Node2D

signal player_life_updated(player_life)
@export var player_life = 3

func game_over():
	print("Moriste hijupe")

func _on_cliente_dañar_personaje() -> void:
	player_life -= 1
	print(player_life, " has recibido daño")
	player_life_updated.emit(player_life)
	if player_life <= 0:
		game_over()
		
## Manager que instancia clientes
