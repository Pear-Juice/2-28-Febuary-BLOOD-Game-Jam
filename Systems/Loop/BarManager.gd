class_name BarManager

extends Node

static var I : BarManager

@export var bar : Bar
@export var bar_camera : Camera

var characters : Array[Character]

signal finished

func _init() -> void:
	I = self

func begin(_characters : Array[Character]):
	print("Begin bar")
	characters = _characters
	
	CharacterQueue.I.populate(characters)

	bar_camera.visible = true
	bar_camera.process_mode = Node.PROCESS_MODE_INHERIT
	bar_camera.camera.make_current()

	loop()

func loop():
	while true:
		var character = CharacterQueue.I.get_character()
		
		if character is Character:
			print("Show bar character: ", character.id.id_name)
			bar.enter(character)
			await get_tree().create_timer(5).timeout
		else:
			break
	
	end()

func end():
	bar_camera.visible = true
	bar_camera.process_mode = Node.PROCESS_MODE_INHERIT
	finished.emit()
	print("Finished bar")
