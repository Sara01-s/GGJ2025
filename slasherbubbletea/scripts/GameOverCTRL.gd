extends Node
@export var trans_finished = false;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

#Funcion que te lleva a la pantalla de titulo
func _goToTitle() -> void:
	get_tree().change_scene_to_file("res://TitleScreen.tscn");
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#Espera a que la transicion de game over termine para recien dejarte irs
func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_ENTER) && trans_finished == true:
		print("está ocurriendo una vez");
		_goToTitle()
	pass
