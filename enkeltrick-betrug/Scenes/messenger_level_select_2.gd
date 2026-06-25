extends Control
@onready var lvl4: Button = $Content/VBoxContainer/Level4Button
@onready var lvl5: Button = $Content/VBoxContainer/GridContainer/Level5Button
@onready var lvl6: Button = $Content/VBoxContainer/GridContainer/Level6Button
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	lvl4.pressed.connect(func(): _start_level("res://lvl/lvl_0_1.gd"))
	lvl5.pressed.connect(func(): _start_level("res://lvl/lvl_1_1.gd"))
	lvl6.pressed.connect(func(): _start_level("res://lvl/lvl_2_1.gd"))
	


func _start_level(level_path: String) -> void:
	GameState.selected_level = level_path
	get_tree().change_scene_to_file("res://Scenes/Handy.tscn")
