class_name ID

extends Resource

@export var id_name : String
@export var is_vampire : bool
@export var image : Image

@export var birth_date_month : int
@export var birth_date_day : int
@export var birth_date_year : int

@export var behavior : Array[String]
@export var appearance : Array[String]

enum DialogueType {INTRO, ORDER}
@export var dialogue : Dictionary[DialogueType, String]
