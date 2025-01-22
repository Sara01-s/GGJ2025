extends MeshInstance3D

@export var _grow_target_scale = Vector3.ONE * 1.1
@export var _grow_duration_sec = 0.1
@export var _shrink_duration_sec = 0.1

var _original_scale := Vector3()

func _ready():
	_original_scale = self.scale

func _on_collision_shape_3d_clicked():
	punch_scale(Vector3(0.9, 0.9, 0.9), 0.1)
	change_color(Color(1, 0, 0))

func _on_collision_shape_3d_enter():
	grow(_grow_target_scale, _grow_duration_sec)
	change_color(Color(0, 1, 0))

func _on_collision_shape_3d_exit():
	shrink(_shrink_duration_sec)
	change_color(Color(1, 1, 1))

func punch_scale(target_scale: Vector3, duration: float):
	var tween = create_tween()
	var new_scale = _original_scale * target_scale

	tween.tween_property(self, "scale", new_scale, duration) \
		 .set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BOUNCE)
	
	tween.tween_property(self, "scale", _original_scale, duration) \
		 .set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BOUNCE)

func grow(target_scale: Vector3, duration: float):
	var tween = create_tween()
	var new_scale = _original_scale * target_scale

	tween.tween_property(self, "scale", new_scale, duration) \
		 .set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BOUNCE)

func shrink(duration: float):
	var tween = create_tween()

	tween.tween_property(self, "scale", _original_scale, duration) \
		 .set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BOUNCE)

func change_color(new_color: Color) -> void:
	if self.material_override and self.material_override is StandardMaterial3D:
		var material = self.material_override
		material.albedo_color = new_color
	else:
		var material = StandardMaterial3D.new()
		material.albedo_color = new_color
		self.material_override = material
