class_name CharacterQueue

extends Node

static var I : CharacterQueue

var queued_characters : Array[Character]
var processed_characters : Array[Character]

func _init() -> void:
	I = self

func populate(characters : Array[Character]):
	queued_characters.clear()
	processed_characters.clear()
	
	queued_characters = characters
	queued_characters.shuffle()

func get_character():
	if queued_characters.is_empty():
		return null
	
	var character = queued_characters.pop_back()
	processed_characters.push_back(character)
	
	return character
