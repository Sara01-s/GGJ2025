extends CollisionShape3D

@export var _ingredient: Recipe.Ingredients = Recipe.Ingredients.NONE;
var is_hovered := false

signal enter
signal exit
signal clicked

func _on_area_3d_mouse_entered() -> void:
	Recipe.add_ingredients(_ingredient)
	enter.emit()
	print("Entered interactable")

func _on_area_3d_mouse_exited() -> void:
	exit.emit()
	print("Exited interactable")

func _on_area_3d_input_event(_camera: Node, event: InputEvent, _event_position: Vector3, _normal: Vector3, _shape_idx: int) -> void:
	var is_clicked = event is InputEventMouseButton \
							and event.pressed \
							and event.button_index == MOUSE_BUTTON_LEFT
						
	if event is InputEventMouseButton:
		if is_clicked:
			clicked.emit()
			print("Clicked interactable!")
