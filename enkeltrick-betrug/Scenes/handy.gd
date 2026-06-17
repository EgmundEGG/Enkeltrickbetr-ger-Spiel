extends Node

@onready var chat = $Chat
@onready var agent_unten = $AgentUnten
@onready var agent_oben = $AgentOben
@onready var lvl_button = $LvLButton
@onready var main_button = $Main_Button
@onready var infoText = $Infotext

var bereit_unten = false
var bereit_oben = false
var aktuelles_level = ""

func _ready():
	agent_unten.hide()
	agent_oben.hide()
	
	agent_unten.tutorial_finished.connect(_on_agent_unten_fertig)
	agent_oben.tutorial_finished.connect(_on_agent_oben_fertig)
	
	starte_level_mit_tutorial()

func starte_level_mit_tutorial():
	bereit_unten = false
	bereit_oben = false
	
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
		
		chat.show()
		infoText.show()
		lvl_button.show()
		main_button.show()
		
		chat.lvlLoad(GameState.selected_level)
