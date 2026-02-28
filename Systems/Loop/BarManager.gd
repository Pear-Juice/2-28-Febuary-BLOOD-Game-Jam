class_name BarManager

extends Node

static var I : BarManager

var characters : Array[Character]

signal finished

func _init() -> void:
	I = self

func begin(_characters : Array[Character]):
	print("Begin bar")
	characters = _characters
	
	CharacterQueue.I.populate(characters)

	loop()

func loop():
	while true:
		var character = CharacterQueue.I.get_character()
		
		if character is Character:
			print("Show bar character: ", character.id.id_name)
			await get_tree().create_timer(1).timeout
		else:
			break
	
	print("Finished day")
	finished.emit()
