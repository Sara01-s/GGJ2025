extends HBoxContainer

const calavera = preload("res://Assets/UI/UI_HeartFull.png")
const calavera_dead = preload ("res://Assets/UI/UI_HeartEmpty.png")

func _on_game_controller_player_life_updated(player_life: Variant) -> void:
	$Corazon.texture = calavera if player_life >= 1 else calavera_dead
	$Corazon2.texture = calavera if player_life >= 2 else calavera_dead
	$Corazon3.texture = calavera if player_life >= 3 else calavera_dead
