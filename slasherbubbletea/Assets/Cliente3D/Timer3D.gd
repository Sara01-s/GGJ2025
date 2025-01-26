extends Timer

signal aumentarDificultad
@onready var current_timer = 10
@onready var timer_3d: Timer = $"."

func _on_timeout() -> void:
	print("Se acabo el tiempo")
	aumentarDificultad.emit()

func _on_aumentar_dificultad() -> void:
	print("\nEstamos acá")
	timer_3d.wait_time = current_timer
	timer_3d.start()

func _on_cliente_dañar_personaje() -> void:
	timer_3d.start()
