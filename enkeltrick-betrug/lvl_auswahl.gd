extends Control
@onready var exitButton = $Exit
@onready var lvl1 = $Button_Tutorial
@onready var lvl2 = $Button
@onready var lvl3 = $Button2
@onready var lvl4 = $Button3
@onready var chat = $"../Chat"

@onready var lvl_panel = $"."

@onready var game_manager = $".."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	exitButton.pressed.connect(_on_exit_pressed)
	lvl1.pressed.connect(_on_lvl1_pressed)
	lvl2.pressed.connect(_on_lvl2_pressed)
	lvl3.pressed.connect(_on_lvl3_pressed)
	lvl4.pressed.connect(_on_lvl4_pressed)
	pass 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_exit_pressed():
	lvl_panel.visible = false
	pass

func _on_lvl1_pressed():
	game_manager.starte_level_mit_tutorial("res://lvl/lvl_tutorial.gd")
	visible = false
	pass
	
func _on_lvl2_pressed():
	game_manager.starte_level_mit_tutorial("res://lvl/lvl_0.gd")
	visible = false
	pass

func _on_lvl3_pressed():
	game_manager.starte_level_mit_tutorial("res://lvl/lvl_1.gd")
	visible = false
	pass

func _on_lvl4_pressed():
	game_manager.starte_level_mit_tutorial("res://lvl/lvl_2.gd")
	visible = false
	pass
