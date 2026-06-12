extends Button

@export var SceneName : String

func _pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/" + SceneName + ".tscn")
