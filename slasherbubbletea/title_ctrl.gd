extends Node
@export var intro_finished = false;
var menu_is_on = false;
@onready var introplayer: AnimationPlayer = $UI_Layer/AnimationPlayer
@onready var EnterTrans: AnimationPlayer = $UI_Layer/TextureRect4/AnimationPlayer
@onready var start_buttn: TextureButton = $UI_Layer/MainMenu/GameStart


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.

# Funcion bb para obligar el foco al botton de iniciar juego, sino,
# los botones no responderan al teclado
func _plsFocus() -> void:
	start_buttn.grab_focus()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Revisa si las condiciones se dan para skippear el intro y no repetir
	if Input.is_action_just_pressed("ui_accept") && intro_finished == false && menu_is_on == false:
		introplayer.seek(4.8,true);
		print("está ocurriendo una vez");
		pass
	
	if Input.is_action_just_pressed("ui_accept") && intro_finished == true && menu_is_on == false:
		EnterTrans.play("DissapearEnt");
		menu_is_on = true;
		print("está ocurriendo otra vez");
		pass
	pass


func _on_game_start_visibility_changed() -> void:
	$UI_Layer/MainMenu/AnimationPlayer.play("MenuCalled")
	_plsFocus()
	pass # Replace with function body.


func _on_main_menu_visibility_changed() -> void:
	
	pass # Replace with function body.


func _on_game_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Assets/Nivel/MaquetaMainSTG.tscn");
	pass # Replace with function body.


func _on_exit_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.
