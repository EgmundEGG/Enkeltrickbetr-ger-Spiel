extends Node

@onready var chat = $Chat
@onready var lvl_auswahl = $LVLAuswahl
@onready var agent_unten = $AgentUnten
@onready var agent_oben = $AgentOben
@onready var lvl_button = $LvLButton
@onready var main_button = $Main_Button
@onready var infoText = $Infotext

var bereit_unten = false
var bereit_oben = false
var aktuelles_level = ""
var phase = "intro"

func _ready():
	agent_unten.hide()
	agent_oben.hide()
	
	agent_unten.tutorial_finished.connect(_on_agent_unten_fertig)
	agent_oben.tutorial_finished.connect(_on_agent_oben_fertig)
	
	chat.level_beendet.connect(_on_level_beendet)
	
func _on_level_beendet(ergebnis_id: String):
	lvl_button.hide()
	main_button.hide()
	
	await get_tree().create_timer(8.0).timeout # spiegelt den Delay wieder, bis der Agent quatscht
	
	phase = "outro"
	bereit_unten = false
	bereit_oben = false
	
	chat.hide()
	infoText.hide()
	
	var level_daten = load(aktuelles_level).new()
	
	agent_unten.start_dialogue(level_daten.auswertung_unten[ergebnis_id])
	agent_oben.start_dialogue(level_daten.auswertung_oben[ergebnis_id])

func starte_level_mit_tutorial(level_pfad: String):
	aktuelles_level = level_pfad
	bereit_unten = false
	bereit_oben = false
	phase = "intro"
	
	# Kram ausblenden
	lvl_auswahl.hide()
	chat.hide()
	lvl_button.hide()
	infoText.hide()
	main_button.hide()
	
	var level_daten = load(level_pfad).new()
	
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
			chat.lvlLoad(aktuelles_level)
			
		elif phase == "outro":
			chat.show()
			infoText.show()
			lvl_button.show()
			main_button.show()
