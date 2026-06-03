extends Control
@onready var exitButton = $Exit
@onready var lvl1 = $Button
@onready var lvl2 = $Button2
@onready var lvl3 = $Button3
@onready var chat = $"../Chat"

@onready var lvl_panel = $"."
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	exitButton.pressed.connect(_on_exit_pressed)
	lvl1.pressed.connect(_on_lvl1_pressed)
	lvl2.pressed.connect(_on_lvl2_pressed)
	lvl3.pressed.connect(_on_lvl3_pressed)
	pass 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_exit_pressed():
	lvl_panel.visible = false
	pass

func _on_lvl1_pressed():
	chat.lvlLoad("res://lvl/lvl_0.gd")
	visible = false
	pass
	
func _on_lvl2_pressed():
	chat.lvlLoad("res://lvl/lvl_1.gd")
	visible = false
	pass

func _on_lvl3_pressed():
	chat.lvlLoad("res://lvl/lvl_2.gd")
	visible = false
	pass
