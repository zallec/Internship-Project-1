extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_button_easy_mode_pressed() -> void:
	GameSettings.set_difficulty("EASY")
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_button_medium_mode_pressed() -> void:
	GameSettings.set_difficulty("MEDIUM")
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_button_hard_mode_pressed() -> void:
	GameSettings.set_difficulty("HARD")
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_button_quit_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
