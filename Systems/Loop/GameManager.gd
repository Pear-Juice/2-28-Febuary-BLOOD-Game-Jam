class_name GameManager

extends Node

static var I : GameManager

signal start_day(day : Day)
signal character_processed

@export var days : Array[Day]

func _init() -> void:
	I = self

func _ready() -> void:
	loop()

func loop():
	while !days.is_empty():
		print("Start day")
		var current_day : Day = days.pop_front()
		
		ReceptionManager.I.begin(current_day.characters.duplicate())
		await ReceptionManager.I.finished
		
		BarManager.I.begin(current_day.characters.duplicate())
		await BarManager.I.finished
		
		await get_tree().create_timer(2).timeout
		print("Finished day")
	print("End game")
