extends Control

@onready var tutorial: Button = $Content/VBoxContainer/TutorialButton
@onready var lvl1: Button = $Content/VBoxContainer/GridContainer/Level1Button
@onready var lvl2: Button = $Content/VBoxContainer/GridContainer/Level2Button
@onready var lvl3: Button = $Content/VBoxContainer/GridContainer/Level3Button




func _ready() -> void:
	tutorial.pressed.connect(func(): _start_level("res://lvl/lvl_tutorial.gd"))
	lvl1.pressed.connect(func(): _start_level("res://lvl/lvl_0.gd"))
	lvl2.pressed.connect(func(): _start_level("res://lvl/lvl_1.gd"))
	lvl3.pressed.connect(func(): _start_level("res://lvl/lvl_2.gd"))
	

func _start_level(level_path: String) -> void:
	GameState.selected_level = level_path
	get_tree().change_scene_to_file("res://Scenes/Handy.tscn")
