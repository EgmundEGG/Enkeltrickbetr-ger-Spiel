extends Control

signal level_beendet(end_knoten) #für Agent-Auswertung

var avatar = "*BiLD*"
var names = "SOHN"
var status = true 

# header 
@onready var labelAvatar = $Background/VBoxContainer/Header/HBoxContainer/Avatar
@onready var labelName = $Background/VBoxContainer/Header/HBoxContainer/Name
@onready var labelStatus = $Background/VBoxContainer/Header/HBoxContainer/Status
#@onready var labelAvatar = $VBoxContainer/Header/HBoxContainer/Avatar
#@onready var labelName = $VBoxContainer/Header/HBoxContainer/Name
#@onready var labelStatus = $VBoxContainer/Header/HBoxContainer/Status
#ScrollBox
@onready var messagecontainer = $Background/VBoxContainer/ScrollContainer/MessageContainer
#@onready var messagecontainer = $VBoxContainer/ScrollContainer/MessageContainer
#footer
@onready var button1 = $Background/VBoxContainer/Footer/Buttonbox/Button
@onready var button2 = $Background/VBoxContainer/Footer/Buttonbox/Button2
@onready var button3 = $Background/VBoxContainer/Footer/Buttonbox/Button3
#@onready var button1 = $VBoxContainer/Footer/Buttonbox/Button
#@onready var button2 = $VBoxContainer/Footer/Buttonbox/Button2
#@onready var button3 = $VBoxContainer/Footer/Buttonbox/Button3

#dialog
var current = "start"
var current_level
var dialog = {}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	setData(avatar,names,status)
	lvlLoad(GameState.selected_level)
	button1.pressed.connect(_on_button1_pressed)
	button2.pressed.connect(_on_button2_pressed)
	button3.pressed.connect(_on_button3_pressed)
	
	pass 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func setData(avatar,names,status) -> void:
	#labelAvatar.text = avatar
	labelName.text = names
	if(status==true):
		labelStatus.text = "Online"
	else: 
		labelStatus.text = "Offline"
	pass


func addBubble(text, is_user:bool) -> void:
	$"../Nachicht".play()
	var align_box = HBoxContainer.new()
	align_box.size_flags_horizontal = Control.SIZE_FILL
	
	#füllt lehrren Platz
	var spacer = Control.new()
	spacer.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	
	var panel = PanelContainer.new()
	var stylebox = StyleBoxFlat.new()
	var label = Label.new()
	#desing
	label.text = text
	label.autowrap_mode = TextServer.AUTOWRAP_WORD #zeilenumbruch
	label.add_theme_color_override("font_color", Color(0.0, 0.0, 0.0, 1.0))
	label.add_theme_font_size_override("font_size", 30)
	label.custom_minimum_size = Vector2(450, 0)  #  Mindestbreite
	
	#ecken abrunden
	stylebox.corner_radius_bottom_left = 10
	stylebox.corner_radius_bottom_right = 10
	stylebox.corner_radius_top_left = 10
	stylebox.corner_radius_top_right = 10
	
	#schrift ist nicht so angeklatscht an den ecken!
	stylebox.content_margin_bottom = 10
	stylebox.content_margin_right = 14
	stylebox.content_margin_top = 10
	stylebox.content_margin_left = 14
	messagecontainer.add_theme_constant_override("separation", 8)
	
	#links/rechts
	if is_user== true:
		stylebox.bg_color = Color.BURLYWOOD
		#panel.modulate = Color.RED
		align_box.add_child(spacer)
		align_box.add_child(panel)
		
	else:
		stylebox.bg_color = Color.GAINSBORO
		align_box.add_child(panel)
		align_box.add_child(spacer)
	
	#überschreibt die Farbe vom panel für bessere farbe
	panel.add_theme_stylebox_override("panel", stylebox)
	panel.add_child(label)
	
	#spawn
	messagecontainer.add_child(align_box)
	pass

func showStep(key:String) ->void:
	current = key
	var data = dialog[key]
	addBubble(data["text"],false)

	
	if data["options"].is_empty():
		button1.hide()
		button2.hide()
		button3.hide()
		labelStatus.text = "OFFLINE"
		level_beendet.emit(key)
		
	else:
		fillButtons(data["options"])
	pass

func fillButtons(options:Array)->void:
	button1.hide()
	button2.hide()
	button3.hide()

	if options.size() > 0:
		button1.show()
		button1.text = options[0]["text"]

	if options.size() > 1:
		button2.show()
		button2.text = options[1]["text"]

	if options.size() > 2:
		button3.show()
		button3.text = options[2]["text"]
	
func _on_button1_pressed() -> void:
	var next = dialog[current]["options"][0]["next"]
	addBubble(button1.text, true)
	showStep(next)

func _on_button2_pressed() -> void:
	var next = dialog[current]["options"][1]["next"]
	addBubble(button2.text, true)
	showStep(next)

func _on_button3_pressed() -> void:
	var next = dialog[current]["options"][2]["next"]
	addBubble(button3.text, true)
	showStep(next)
	
func lvlLoad(path:String) -> void:
	$"../Spiel start".play()
	current_level = load(path).new()
	dialog = current_level.dialog
	
	
	# Chat resetten (wichtig!)
	for child in messagecontainer.get_children():
		child.queue_free()
	
	showStep("start")
	pass
