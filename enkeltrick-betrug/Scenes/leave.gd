extends TextureRect

@export var SceneName : String


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _gui_input(event):
	# Check if the event is a mouse button click
	if event is InputEventMouseButton:
		# Check if it's the left mouse button and it was just pressed
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			get_tree().change_scene_to_file("res://Scenes/" + SceneName + ".tscn")
		
