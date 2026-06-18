extends Control

signal tutorial_finished

@onready var text_label = $RichTextLabel
@onready var next_button = $NextButton
@onready var skip_button = $SkipButton

var dialog_texte = []
var aktueller_index = 0
var skip_status = 0

func _ready():
	skip_button.pressed.connect(_on_skip_button_pressed)

func start_dialogue(texte: Array):
	dialog_texte = texte
	aktueller_index = 0
	
	skip_status = 0
	skip_button.text = "Überspringen"
	skip_button.modulate = Color(1, 1, 1)
	
	show()
	update_text()

func update_text():
	if dialog_texte.size() == 0:
		return
		
	text_label.text = dialog_texte[aktueller_index]
	
	if aktueller_index == dialog_texte.size() - 1:
		next_button.text = "Bereit!"
	else:
		next_button.text = "Weiter"

func _on_next_button_pressed():
	if skip_status == 1:
		skip_status = 0
		skip_button.text = "Überspringen"
		skip_button.modulate = Color(1, 1, 1)
	
	if aktueller_index >= dialog_texte.size() - 1:
		hide()
		tutorial_finished.emit()
	else:
		aktueller_index += 1
		update_text()

func _on_skip_button_pressed():
	if skip_status == 0:
		skip_button.text = "Sicher überspringen?"
		skip_button.modulate = Color(1, 0.5, 0.5)
		skip_status = 1
	elif skip_status == 1:
		hide()
		tutorial_finished.emit()
