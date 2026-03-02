extends Area3D

@onready var textbox_graphic = $"../Textbox"
@onready var textbox = $"../Textbox/Label3D"

var current_character_dialogue : Array[String] = [
	"I am a vampire! Don't give me blood though. I'm vegan.", 
	"Second text."]
var current_dialogue_position : int = 0;
var is_character_present : bool = true
var revealing_text : bool = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _mouse_enter():
	print("Enter Character area box")

func _mouse_exit():
	print("Exit Character area box")

func _mouse_click():
	reveal_text()



func reveal_text():
	if is_character_present && !revealing_text:
		textbox_graphic.set_visible(true)
		revealing_text = true
		textbox.text = current_character_dialogue[current_dialogue_position % current_character_dialogue.size()]
		current_dialogue_position += 1
		if(textbox.text.length() == 0):
			textbox.text = "No text to display. Oops."
		#to prevent double clicks
		await get_tree().create_timer(1.0).timeout
		revealing_text = false
		
		await get_tree().create_timer(5.0).timeout
		if !revealing_text: 
			textbox_graphic.set_visible(false)
