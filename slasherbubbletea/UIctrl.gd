extends Control

@onready var btn_anim: AnimationPlayer = $TextureButton/AnimationPlayer
@onready var scn_cam: AnimationPlayer = $"../Camera3D/AnimationPlayer"
@onready var text_button: TextureButton = $TextureButton
@onready var text_button2: TextureButton = $TextureButton2
@onready var termoLeche: MeshInstance3D = $"../ObjScen/termo_leche/termo_te"
@onready var hielos: MeshInstance3D = $"../ObjScen/hielos/hielos"
@onready var termoTe: MeshInstance3D = $"../ObjScen/termo_te/termo_leche"
@onready var vasochi: MeshInstance3D = $"../ObjScen/vaso_chico/vaso"
@onready var vasogra: MeshInstance3D = $"../ObjScen/grande/vaso"

const GROW_SCALE := Vector3.ONE * 1.1
const ORIGINAL_SCALE := Vector3.ONE
const INTERACTION_DURATION_SEC := 0.1
const HIGHLIGHT = preload("res://materiales/Highlight.tres")

@export var works = 1
@export var Plyr_hp = 3
var bookIsOn = false

####       Descripcion de este controlador
#### Este script funciona de controlador no solo para el UI, sino para todo
#### el stage. 
#### Las variables on ready tienen las referencias de ruta de los nodos, mientras
#### que las variables Plyr_hp corresponden al valor de vida del jugador, 
#### y bookIsOn funciona como condicion para que el Libro en el UI se anime sin
#### interrupciones.
#### works es una variable que solo existe para revisar si funciona algo. 
#### Casi lo mismo que print.

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

####       ANIMACIONES E INTERACCION DE BOTONES

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

#         Funcion de señal recibida del texture rect conteniendo el libro
#  El click de mouse es reconocido como input event de GUI, por lo que en la 
# señal se esta revisando que se haga click, que sea el botton izquierdo, y 
# junto con lo anterior ve dos escenarios, si es que el bool de libro es true o false 

func _on_texture_rect_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed && bookIsOn == false:
		print("you've clicked me!")
		$TextureRect/AnimationPlayer.play("SlideUp")
		bookIsOn = true
		pass
	elif event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed && bookIsOn == true:
		print("you've clicked me!")
		$TextureRect/AnimationPlayer.play_backwards("SlideUp")
		bookIsOn = false
		pass
	pass # Replace with function body.

####                     CONTROL DE STAGE 
####               Deteccion de mouse encima de area3D
#### Es importante que, para que esto funcione, el control debe quedar en custom
#### o de cualquier forma menos full rect, o se interpondrá en la deteccion
#### ya que va por orden de visibilidad/arbol, y full rect tapa el area de deteccion 3D.
#################          Mouse enter
func _on_area_3d_mouse_entered() -> void:
	termoLeche.material_overlay = HIGHLIGHT
	grow(termoLeche, ORIGINAL_SCALE, GROW_SCALE, INTERACTION_DURATION_SEC)
	pass # Replace with function body.

func _on_area_hielo_mouse_entered() -> void:
	hielos.material_overlay = HIGHLIGHT
	grow(hielos, ORIGINAL_SCALE, GROW_SCALE, INTERACTION_DURATION_SEC)
	pass # Replace with function body.

func _on_area_te_mouse_entered() -> void:
	termoTe.material_overlay = HIGHLIGHT
	grow(termoTe, ORIGINAL_SCALE, GROW_SCALE, INTERACTION_DURATION_SEC)
	pass # Replace with function body.

func _on_area_basu_mouse_entered() -> void:
	get_tree().set_group("basurero", "material_overlay", HIGHLIGHT)
	pass # Multiples meshes, los agrupe y use set group para cambiar sus props.

func _on_area_vaso_chi_mouse_entered() -> void:
	vasochi.material_overlay = HIGHLIGHT
	grow(vasochi, ORIGINAL_SCALE, GROW_SCALE, INTERACTION_DURATION_SEC)
	pass # Replace with function body.

func _on_area_vasogra_mouse_entered() -> void:
	vasogra.material_overlay = HIGHLIGHT
	grow(vasogra, ORIGINAL_SCALE, GROW_SCALE, INTERACTION_DURATION_SEC)
	pass # Replace with function body.

func _on_area_jelly_mouse_entered() -> void:
	for mesh in get_tree().get_nodes_in_group("Jelly"):
		grow(mesh, ORIGINAL_SCALE, GROW_SCALE, INTERACTION_DURATION_SEC)
		
	get_tree().set_group("Jelly", "material_overlay", HIGHLIGHT)
	pass # Replace with function body.

func _on_area_tapi_mouse_entered() -> void:
	for mesh in get_tree().get_nodes_in_group("Tapioca"):
		grow(mesh, ORIGINAL_SCALE, GROW_SCALE, INTERACTION_DURATION_SEC)
	get_tree().set_group("Tapioca", "material_overlay", HIGHLIGHT)
	pass # Replace with function body.

func _on_area_mara_mouse_entered() -> void:
	for mesh in get_tree().get_nodes_in_group("Maracuya"):
		grow(mesh, ORIGINAL_SCALE, GROW_SCALE, INTERACTION_DURATION_SEC)
	get_tree().set_group("Maracuya", "material_overlay", HIGHLIGHT)
	pass # Replace with function body.

func _on_area_cere_mouse_entered() -> void:
	for mesh in get_tree().get_nodes_in_group("Cereza"):
		grow(mesh, ORIGINAL_SCALE, GROW_SCALE, INTERACTION_DURATION_SEC)
	get_tree().set_group("Cereza", "material_overlay", HIGHLIGHT)
	pass # Replace with function body.

#########################################################
#################       Mouse exit    ###################

func _on_area_3d_mouse_exited() -> void:
	termoLeche.material_overlay = null
	shrink(termoLeche, ORIGINAL_SCALE, INTERACTION_DURATION_SEC)
	pass # Replace with function body.

func _on_area_te_mouse_exited() -> void:
	termoTe.material_overlay = null
	shrink(termoTe, ORIGINAL_SCALE, INTERACTION_DURATION_SEC)
	pass # Replace with function body.

func _on_area_hielo_mouse_exited() -> void:
	hielos.material_overlay = null
	shrink(hielos, ORIGINAL_SCALE, INTERACTION_DURATION_SEC)
	pass # Replace with function body.

func _on_area_basu_mouse_exited() -> void:
	get_tree().set_group("basurero", "material_overlay", null)
	pass # Replace with function body.

func _on_area_vaso_chi_mouse_exited() -> void:
	vasochi.material_overlay = null
	shrink(vasochi, ORIGINAL_SCALE, INTERACTION_DURATION_SEC)
	pass # Replace with function body.

func _on_area_vasogra_mouse_exited() -> void:
	vasogra.material_overlay = null
	shrink(vasogra, ORIGINAL_SCALE, INTERACTION_DURATION_SEC)
	pass # Replace with function body.

func _on_area_jelly_mouse_exited() -> void:
	for mesh in get_tree().get_nodes_in_group("Jelly"):
		shrink(mesh, ORIGINAL_SCALE, INTERACTION_DURATION_SEC)
	
	get_tree().set_group("Jelly", "material_overlay", null)
	pass # Replace with function body.

func _on_area_tapi_mouse_exited() -> void:
	for mesh in get_tree().get_nodes_in_group("Tapioca"):
		shrink(mesh, ORIGINAL_SCALE, INTERACTION_DURATION_SEC)
	get_tree().set_group("Tapioca", "material_overlay", null)
	pass # Replace with function body.

func _on_area_mara_mouse_exited() -> void:
	for mesh in get_tree().get_nodes_in_group("Maracuya"):
		shrink(mesh, ORIGINAL_SCALE, INTERACTION_DURATION_SEC)
	get_tree().set_group("Maracuya", "material_overlay", null)
	pass # Replace with function body.

func _on_area_cere_mouse_exited() -> void:
	for mesh in get_tree().get_nodes_in_group("Cereza"):
		shrink(mesh, ORIGINAL_SCALE, INTERACTION_DURATION_SEC)
	get_tree().set_group("Cereza", "material_overlay", null)
	pass # Replace with function body.

#########################################################
#################       Mouse click    ##################

func _on_area_3d_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	pass # Replace with function body.
	
#########################################################
#################       Game feel      ##################
func punch_scale(target: MeshInstance3D, original_scale: Vector3, target_scale: Vector3, duration: float):
	var tween = create_tween()
	var new_scale = original_scale * target_scale

	tween.tween_property(target, "scale", new_scale, duration) \
		 .set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BOUNCE)
	
	tween.tween_property(self, "scale", original_scale, duration) \
		 .set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BOUNCE)

func grow(target: MeshInstance3D, original_scale: Vector3, target_scale: Vector3, duration: float):
	var tween = create_tween()
	var new_scale = original_scale * target_scale

	tween.tween_property(target, "scale", new_scale, duration) \
		 .set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BOUNCE)

func shrink(target: MeshInstance3D, original_scale: Vector3, duration: float):
	var tween = create_tween()

	tween.tween_property(target, "scale", original_scale, duration) \
		 .set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BOUNCE)
