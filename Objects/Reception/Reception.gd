class_name Reception

extends Node

signal character_enter

@export var character_obj_scn : PackedScene

@export var entrance : Node3D
@export var exit : Node3D
@export var target : Node3D

@export var enter_time := 1.0
@export var exit_time := 1.5

var character_obj : CharacterObj

func enter(character : Character):
	character_obj = character_obj_scn.instantiate()
	character_obj.initialize(character)
	add_child(character_obj)
	character_obj.global_position = entrance.global_position
	character_obj.sprite3D.modulate = Color.from_rgba8(20,20,20,255)
	
	var tween_pos = create_tween()
	var tween_color = create_tween()
	tween_pos.tween_property(character_obj, "global_position", target.global_position, enter_time)
	tween_color.tween_property(character_obj.sprite3D, "modulate", Color.from_rgba8(220,180,180,255), enter_time)
	await tween_pos.finished
	await get_tree().create_timer(2).timeout
	leave()

func leave():
	var tween_pos = create_tween()
	var tween_color = create_tween()
	
	tween_pos.tween_property(character_obj, "global_position", exit.global_position, exit_time)
	tween_color.tween_property(character_obj.sprite3D, "modulate", Color.from_rgba8(20,20,20,20), exit_time)
	
	await tween_pos.finished
	character_obj.queue_free()
