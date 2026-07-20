class_name RotatingDoor
extends Marker3D

@export var start_open: bool
@export var open_angle: float
@export var open_speed: float

var _initial_rotation: float = 0.0
var _target_rotation: float = 0.0
var _is_open: bool = false
var _initial_basis := Vector3.ZERO


func _ready() -> void:
	_initial_rotation = rotation_degrees.y
	_initial_basis = global_basis.z

	if start_open:
		_is_open = true
		_target_rotation = open_angle


func _process(delta) -> void:
	rotation_degrees.y = move_toward(
			rotation_degrees.y,
			_initial_rotation + _target_rotation,
			1.0 - exp(-open_speed * 100 * delta)
	)


func open() -> void:
	_is_open = not _is_open

	var open_direction: int = sign(Player.instance.head.global_basis.z.dot(_initial_basis))
	_target_rotation = (open_angle if _is_open else 0.0) * open_direction
