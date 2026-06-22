extends Node

@onready var chat = $Chat
@onready var agent_unten = $AgentUnten
@onready var agent_oben = $AgentOben
@onready var lvl_button = $LvLButton
@onready var main_button = $Main_Button
@onready var infoText = $Infotext

@onready var unten_box = $ColorRect
@onready var header = $ColorRect/VBoxContainer/Header
@onready var footer = $ColorRect/VBoxContainer/Footer
@onready var grid = $GridContainer
@onready var selection = $VBoxContainer

@onready var labels = [
	$ColorRect/VBoxContainer/Header/HBoxContainer/Name,
	$ColorRect/VBoxContainer/Header/HBoxContainer/Status
]

var bereit_unten = false
var bereit_oben = false
var phase = "intro"

func _ready():
	agent_unten.hide()
	agent_oben.hide()
	
	agent_unten.tutorial_finished.connect(_on_agent_unten_fertig)
	agent_oben.tutorial_finished.connect(_on_agent_oben_fertig)
	
	chat.level_beendet.connect(_on_level_beendet)
	starte_level_mit_tutorial()
	_update_ui_scaling()
	get_tree().get_root().size_changed.connect(_update_ui_scaling)
	
func _on_level_beendet(ergebnis_id: String):
	lvl_button.hide()
	main_button.hide()
	
	await get_tree().create_timer(8.0).timeout # spiegelt den Delay wieder, bis der Agent quatscht
	
	phase = "outro"
	bereit_unten = false
	bereit_oben = false
	
	chat.hide()
	infoText.hide()
	
	var level_daten = chat.current_level
	
	agent_unten.start_dialogue(level_daten.auswertung_unten[ergebnis_id])
	agent_oben.start_dialogue(level_daten.auswertung_oben[ergebnis_id])

func starte_level_mit_tutorial():
	bereit_unten = false
	bereit_oben = false
	phase = "intro"
	
	# Kram ausblenden
	chat.hide()
	lvl_button.hide()
	infoText.hide()
	main_button.hide()
	
	var level_daten = load(GameState.selected_level).new()
	
	agent_unten.start_dialogue(level_daten.agenten_text_unten)
	agent_oben.start_dialogue(level_daten.agenten_text_oben)

func _on_agent_unten_fertig():
	bereit_unten = true
	checke_start()

func _on_agent_oben_fertig():
	bereit_oben = true
	checke_start()

func checke_start():
	if bereit_unten and bereit_oben:
		
		if phase == "intro":
			chat.show()
			infoText.show()
			lvl_button.show()
			main_button.show()
			chat.lvlLoad(GameState.selected_level)
			
		elif phase == "outro":
			chat.show()
			infoText.show()
			lvl_button.show()
			main_button.show()

func _update_ui_scaling() -> void:
	print("SIZE CHANGE")
	await get_tree().create_timer(0.1).timeout
	var screen_height: float = get_viewport().size.y
	var screen_width: float = get_viewport().size.x
	var new_font_size: int = int(screen_height * 0.01)
	
	
	#THIS WAIT TIMER IS VERY IMPORTANT IT WAITS TILL EVERY ITEM IS REDRAWN
	#and yes it doesnt check for a redraw it just waits
	await get_tree().create_timer(0.1).timeout
	
	unten_box.custom_minimum_size.x = screen_width/2
	footer.custom_minimum_size.y = screen_height/6
	header.custom_minimum_size.y = screen_height/6
	grid.custom_minimum_size.x = screen_width/2 - screen_width/10
	selection.custom_minimum_size.x = screen_width/10
	for t in labels:
		t.add_theme_font_size_override("font_size", new_font_size*6)
	
	
