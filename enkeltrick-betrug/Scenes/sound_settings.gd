extends PanelContainer

@onready var title = $MarginContainer/VBoxContainer/HBoxContainer/Sound

@onready var text_field = [
	$MarginContainer/VBoxContainer/VBoxContainer/Master,
	$MarginContainer/VBoxContainer/VBoxContainer2/Music,
	$MarginContainer/VBoxContainer/VBoxContainer3/Sound_Effect
]

@onready var offset = $MarginContainer/VBoxContainer/HBoxContainer/Control

@onready var icon = $MarginContainer/VBoxContainer/HBoxContainer/Leave

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_update_ui_scaling()
	get_tree().get_root().size_changed.connect(_update_ui_scaling)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _update_ui_scaling() -> void:

	var screen_height: float = get_viewport_rect().size.y
	var new_font_size: int = int(screen_height * 0.01)
	
	title.add_theme_font_size_override("font_size", new_font_size*10)
	for b in text_field:
		print(b)
		b.add_theme_font_size_override("font_size", new_font_size*8)
	
	#THIS WAIT TIMER IS VERY IMPORTANT IT WAITS TILL EVERY ITEM IS REDRAWN
	#and yes it doesnt check for a redraw it just waits
	await get_tree().create_timer(0.1).timeout
	var screen_width: float = get_viewport_rect().size.x
	
	var icon_width = icon.size.x
	var title_width = title.size.x
	
	var size = screen_width/2  - title_width/2 - icon_width
	offset.custom_minimum_size.x = size
