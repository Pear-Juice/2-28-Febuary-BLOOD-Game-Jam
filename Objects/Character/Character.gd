extends Node

@onready var camera = $Camera3D
@onready var rayCast = $RayCast3D
@export_range(0.0, 1.0) var sensitivity = 0.005

#const SPEED = 5.0
#const JUMP_VELOCITY = 4.5

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event):
	if event is InputEventMouseMotion:
		var movement = Vector3(-event.relative.x, event.relative.y, 0) * sensitivity
		var target_position = camera.position + movement

		var plane_position = get_node("/root/Node3D/StaticBody3D").global_transform.origin
		var min_x = plane_position.x - 1
		var max_x = plane_position.x + 1
		var min_y = plane_position.y - 1
		var max_y = plane_position.y + 1
		
		var view_direction = -camera.global_transform.basis.z.normalized()
		camera.position = Vector3(
			clamp(target_position.x, min_x / target_position.z, max_x / target_position.z),
			clamp(target_position.y, min_y / target_position.z, max_y / target_position.z),
			target_position.z
		)
		camera.translate(view_direction * movement.z)

func _physics_process(delta: float) -> void:
	pass
	# Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta

	#move_and_slide()
