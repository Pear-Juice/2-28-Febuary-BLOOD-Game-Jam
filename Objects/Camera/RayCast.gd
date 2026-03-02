extends RayCast3D

var hit_obj : Node3D
var has_entered : bool
var has_exited : bool
var has_clicked : bool

func _physics_process(delta: float) -> void:
	if is_colliding():
		hit_obj = get_collider() as Node3D
		if(!hit_obj.has_method("_mouse_click")):
			hit_obj = get_collider().get_parent() as Node3D
		
		if hit_obj:
			if hit_obj.has_method("_mouse_enter") && !has_entered:
				hit_obj._mouse_enter()
				has_entered = true
				has_exited = false
				
			if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
				if hit_obj.has_method("_mouse_click") && !has_clicked:
					hit_obj._mouse_click()
					has_clicked = true
			else:
				has_clicked = false
	elif hit_obj:
		if hit_obj.has_method("_mouse_exit") && !has_exited:
			hit_obj._mouse_exit()
			has_entered = false
			has_exited = true
