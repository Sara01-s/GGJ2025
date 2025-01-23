extends Timer

signal aumentarDificultad
@onready var timer: Timer = $"."
@onready var current_timer = 10

func _on_timeout() -> void:
	print("Se acabo el tiempo")
	aumentarDificultad.emit()

func _on_aumentar_dificultad() -> void:
	print("\nEstamos acá")
	timer.wait_time = current_timer
	timer.start()


func _on_cliente_dañar_personaje() -> void:
	timer.start()
