extends Node3D

var isClienteOn = false
@export var remaininglife = 3
@onready var CLIENTE_3D = preload("res://Assets/Cliente3D/Cliente3D.tscn")


func _ready() -> void:	
	pass

func _process(delta: float) -> void:
	if isClienteOn == false:
		isClienteOn = true
		var cliente = CLIENTE_3D.instantiate()
		get_parent().add_child(cliente)
		cliente.global_position = global_position

func _on_cliente_personaje_happy() -> void:
	isClienteOn = false
