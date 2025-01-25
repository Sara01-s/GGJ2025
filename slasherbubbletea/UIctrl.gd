extends Control
@onready var btn_anim: AnimationPlayer = $TextureButton/AnimationPlayer
@onready var scn_cam: AnimationPlayer = $"../Camera3D/AnimationPlayer"
@onready var text_button: TextureButton = $TextureButton
@onready var text_button2: TextureButton = $TextureButton2

@export var works = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_texture_button_mouse_entered() -> void:
	btn_anim.play("ANM_Bttn_selectd", -1);
	pass # Replace with function body.


func _on_texture_button_mouse_exited() -> void:
	btn_anim.play("RESET", -1);
	pass # Replace with function body.


func _on_texture_button_pressed() -> void:
	scn_cam.play("PanRIGHT")
	text_button.visible = false;
	text_button2.visible = true;
	pass # Replace with function body.


func _on_texture_button_2_pressed() -> void:
	scn_cam.play_backwards("PanRIGHT");
	text_button2.visible = false;
	text_button.visible = true;
	pass # Replace with function body.
