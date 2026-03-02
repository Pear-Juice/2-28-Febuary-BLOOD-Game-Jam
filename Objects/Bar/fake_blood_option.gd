extends Sprite3D

@export var x_target : float = 0
@export var y_target : float = 10
@export var z_target : float = 0

@onready var starting_location : Vector3 = position
@onready var target_location : Vector3 

var rotate_tween : Tween

func _ready():
	await get_tree().create_timer(2.0).timeout
	move_sprite_and_collision()
	await get_tree().create_timer(1.0).timeout
	move_to_starting_position()


func move_sprite_and_collision():
	if rotate_tween: rotate_tween.kill()
	target_location = starting_location + Vector3(
		x_target,
		y_target,
		z_target,
	)
	rotate_tween = get_tree().create_tween()
	rotate_tween.tween_property(self, "position", target_location, 0.3)

func move_to_starting_position():
	if rotate_tween: rotate_tween.kill()
	rotate_tween = get_tree().create_tween()
	rotate_tween.tween_property(self, "position", starting_location, 0.05)

func _mouse_enter():
	print("Enter")
	move_sprite_and_collision()
	
func _mouse_exit():
	print("Exit")
	move_to_starting_position()

func _mouse_click():
	print("Chose fake blood")
