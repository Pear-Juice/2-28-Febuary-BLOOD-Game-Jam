class_name CharacterObj

extends Node3D

@export var sprite3D : Sprite3D

func initialize(character : Character):
	sprite3D.texture = character.sprite
