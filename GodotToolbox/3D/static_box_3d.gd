@tool
class_name StaticBox3D
extends StaticBody3D

var _shape_res : BoxShape3D:
	get:
		return %Collision.shape

var _mesh_res : BoxMesh:
	get:
		return %Mesh.mesh

var _size : Vector3 = Vector3(1.0, 1.0, 1.0)
@export_custom(PROPERTY_HINT_NONE, "suffix:m") var size : Vector3:
	get:
		return _size
	set(new_size):
		_size = new_size
		if is_inside_tree():
			_update_size()

func _update_size() -> void:
	_shape_res.size = size
	_mesh_res.size = size

var _material_res : StandardMaterial3D:
	get:
		return _mesh_res.material

var _color : Color = Color.WHITE
@export var color : Color:
	get:
		return _color
	set(new_color):
		_color = new_color
		if is_inside_tree():
			_update_color()

func _update_color() -> void:
	_material_res.albedo_color = _color

func _ready() -> void:
	_update_size()
	_update_color()
