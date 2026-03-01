class_name Camera

extends Node3D

@export var camera : Camera3D
@export var rayCast := RayCast3D
@export_range(0.0, 1.0) var sensitivity = 0.1
var _mouse_rotation : Vector3
var _rotation_input : float
var _tilt_input : float
var _camera_rotation : Vector3
@export_range(-90,0) var x_tilt_min : int = -45
@export_range(0, 90) var x_tilt_max : int = 45 
@export_range(-90,0) var y_tilt_min : int = -60
@export_range(0, 90) var y_tilt_max : int = 60

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event):
	if event is InputEventMouseMotion:
		_rotation_input = -event.relative.x * sensitivity
		_tilt_input = -event.relative.y * sensitivity
		print(Vector2(_rotation_input,_tilt_input))

func _physics_process(delta: float) -> void:
	_update_camera(delta)

func _update_camera(delta : float):
	_mouse_rotation.x += _tilt_input * delta
	_mouse_rotation.x = clamp(_mouse_rotation.x, deg_to_rad(x_tilt_min), deg_to_rad(x_tilt_max))
	_mouse_rotation.y += _rotation_input * delta
	_mouse_rotation.y = clamp(_mouse_rotation.y, deg_to_rad(y_tilt_min), deg_to_rad(y_tilt_max))
	
	_camera_rotation = Vector3(_mouse_rotation.x,_mouse_rotation.y,0.0)
	
	camera.transform.basis = Basis.from_euler(_camera_rotation)
	camera.rotation.z = 0.0
	
	
	_rotation_input = 0.0
	_tilt_input = 0.0
