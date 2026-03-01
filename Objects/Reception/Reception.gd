class_name Reception

extends Node

signal character_enter

@export var character_obj_scn : PackedScene

@export var entrance : Node3D
@export var exit : Node3D
@export var target : Node3D

var character_obj : CharacterObj

func enter(character : Character):
	character_obj = character_obj_scn.instantiate()
	character_obj.initialize(character)
	add_child(character_obj)
	character_obj.global_position = entrance.global_position
	
	var tween = create_tween()
	tween.tween_property(character_obj, "global_position", target.global_position, 1)
	await tween.finished
	await get_tree().create_timer(2).timeout
	leave()

func leave():
	var tween = create_tween()
	tween.tween_property(character_obj, "global_position", exit.global_position, 1)
	await tween.finished
	character_obj.queue_free()
