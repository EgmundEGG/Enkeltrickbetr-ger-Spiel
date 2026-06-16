extends Button

@onready var level_panel = $"../../LVLAuswahl"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	level_panel.visible = false
	pressed.connect(_on_pressed)
	pass # Replace with function body.

func _on_pressed():
	level_panel.visible = true
