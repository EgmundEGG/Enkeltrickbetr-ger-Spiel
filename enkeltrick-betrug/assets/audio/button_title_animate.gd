extends Button

var tween: Tween

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pivot_offset = size / 2.0
	resized.connect(func(): pivot_offset = size / 2.0)
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)

func _on_mouse_entered() -> void:
	z_index = 1
	reset_tween()
	tween.set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_ELASTIC)
	tween.tween_property(self, "scale", Vector2(1.1,1.1), 0.4)

func _on_mouse_exited() -> void:
	z_index = 0
	reset_tween()
	tween.set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_ELASTIC)
	tween.tween_property(self, "scale", Vector2.ONE, 0.4)

func reset_tween() -> void:
	if tween:
		tween.kill()
	tween = create_tween()
