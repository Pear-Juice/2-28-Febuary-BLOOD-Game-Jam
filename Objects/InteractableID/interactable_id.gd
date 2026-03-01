extends Sprite3D

@export var x_rotate : float = 0
@export var y_rotate : float = 10
@export var z_rotate : float = 0

@onready var starting_rotation : Vector3 = rotation
@onready var target_rotation : Vector3 

var rotate_tween : Tween

func _ready():
	await get_tree().create_timer(2.0).timeout
	rotate_sprite_and_collision()
	await get_tree().create_timer(1.0).timeout
	rotate_to_starting_position()


func rotate_sprite_and_collision():
	if rotate_tween: rotate_tween.kill()
	target_rotation = starting_rotation + Vector3(
		deg_to_rad(x_rotate),
		deg_to_rad(y_rotate),
		deg_to_rad(z_rotate),
	)
	rotate_tween = get_tree().create_tween()
	rotate_tween.tween_property(self, "rotation", target_rotation, 0.3)

func rotate_to_starting_position():
	if rotate_tween: rotate_tween.kill()
	rotate_tween = get_tree().create_tween()
	rotate_tween.tween_property(self, "rotation", starting_rotation, 0.05)

func _on_area_3d_mouse_entered() -> void:
	rotate_sprite_and_collision()


func _on_area_3d_mouse_exited() -> void:
	rotate_to_starting_position()
