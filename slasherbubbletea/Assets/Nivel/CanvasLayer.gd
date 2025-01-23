extends HBoxContainer

@onready var texture_rect: TextureRect = $TextureRect
const calavera = preload("res://Assets/UI/UI_IconDead.png")
const calavera_dead = preload ("res://Assets/UI/Calavera_Dead.png")

func _on_game_controller_player_life_updated(player_life: Variant) -> void:
	$Calavera1.texture = calavera if player_life >= 1 else calavera_dead
	$Calavera2.texture = calavera if player_life >= 2 else calavera_dead
	$Calavera3.texture = calavera if player_life >= 3 else calavera_dead
