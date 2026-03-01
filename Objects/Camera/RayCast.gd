extends RayCast3D



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if is_colliding():
		var hit = get_collider()
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			print("User clicked " + hit.name)
