class_name ReceptionManager

extends Node

static var I : ReceptionManager

var characters : Array[Character]

signal finished

@export var reception : Reception
@export var reception_camera : Camera

func _init() -> void:
	I = self

func begin(_characters : Array[Character]):
	print("Begin reception")
	characters = _characters
	
	CharacterQueue.I.populate(characters)
	
	reception_camera.visible = true
	reception_camera.process_mode = Node.PROCESS_MODE_INHERIT
	reception_camera.camera.make_current()
	loop()

func loop():
	while true:
		var character = CharacterQueue.I.get_character()
		
		if character is Character:
			print("Show reception character: ", character.id.id_name)
			reception.enter(character)
			await get_tree().create_timer(5).timeout
		else:
			end()
			break

	finished.emit()

func end():
	reception_camera.visible = false
	reception_camera.process_mode = Node.PROCESS_MODE_DISABLED
	print("Finished reception")
