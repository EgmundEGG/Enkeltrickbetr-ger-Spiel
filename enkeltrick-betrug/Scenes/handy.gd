extends Node

@onready var chat = $Chat
@onready var agent_unten = $AgentUnten
@onready var agent_oben = $AgentOben
@onready var infoText = $Infotext

#sind die Variablen, welche alle für das Scaling verwendet werden
@onready var chat2 = $ColorRect
@onready var header = $ColorRect/VBoxContainer/Header
@onready var footer = $ColorRect/VBoxContainer/Footer
@onready var grid = $GridContainer
@onready var menu = $Menu
@onready var menu_labels = [
	$Menu/Button,
	$Menu/Main_Button
]
@onready var labels = [
	$ColorRect/VBoxContainer/Header/HBoxContainer/Name,
	$ColorRect/VBoxContainer/Header/HBoxContainer/Status
]
@onready var postit_labels = [
	$GridContainer/PostIt1/Title,
	$GridContainer/PostIt1/Content,
	$GridContainer/PostIt2/Title,
	$GridContainer/PostIt2/Content,
	$GridContainer/PostIt3/Title,
	$GridContainer/PostIt3/Content,
	$GridContainer/PostIt4/Title,
	$GridContainer/PostIt4/Content
]

var bereit_unten = false
var bereit_oben = false
var phase = "intro"

func _ready():
	agent_unten.hide()
	agent_oben.hide()
	
	agent_unten.tutorial_finished.connect(_on_agent_unten_fertig)
	agent_oben.tutorial_finished.connect(_on_agent_oben_fertig)
	
	chat2.level_beendet.connect(_on_level_beendet)
	starte_level_mit_tutorial()
	_update_ui_scaling()
	get_tree().get_root().size_changed.connect(_update_ui_scaling)
	
func _on_level_beendet(ergebnis_id: String):
	menu.hide()
	
	await get_tree().create_timer(8.0).timeout # spiegelt den Delay wieder, bis der Agent quatscht
	
	phase = "outro"
	bereit_unten = false
	bereit_oben = false
	
	chat2.hide()
	#infoText.hide()
	grid.hide()
	
	var level_daten = chat2.current_level
	
	agent_unten.start_dialogue(level_daten.auswertung_unten[ergebnis_id])
	agent_oben.start_dialogue(level_daten.auswertung_oben[ergebnis_id])

func starte_level_mit_tutorial():
	bereit_unten = false
	bereit_oben = false
	phase = "intro"
	
	# Kram ausblenden
	chat2.hide()
	#infoText.hide()
	grid.hide()
	menu.hide()
	
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
			chat2.show()
			#infoText.show()
			grid.show()
			menu.show()
			chat2.lvlLoad(GameState.selected_level)
			
		elif phase == "outro":
			chat2.show()
			#infoText.show()
			grid.show()
			menu.show()

#Scaled die UI Passend zur Größe des Bildschirmes
func _update_ui_scaling() -> void:
	#await get_tree().create_timer(0.1).timeout
	var screen_height: float = get_viewport().size.y
	var screen_width: float = get_viewport().size.x
	var new_font_size: int = int(screen_height * 0.01)
	
	
	#THIS WAIT TIMER IS VERY IMPORTANT IT WAITS TILL EVERY ITEM IS REDRAWN
	#and yes it doesnt check for a redraw it just waits
	await get_tree().create_timer(0.1).timeout
	
	grid.position.y = screen_height
	grid.position.x = screen_width - screen_width/7
	grid.size.x = screen_width/3
	chat2.custom_minimum_size.x = screen_width/2
	footer.custom_minimum_size.y = screen_height/6
	header.custom_minimum_size.y = screen_height/6
	menu.custom_minimum_size.x = screen_width/10
	menu.custom_minimum_size.y = screen_height/10
	for t in labels:
		t.add_theme_font_size_override("font_size", new_font_size*6)
	for l in menu_labels:
		l.add_theme_font_size_override("font_size", new_font_size*4)
	for l in postit_labels:
		l.add_theme_font_size_override("font_size", new_font_size*3)
	
	
