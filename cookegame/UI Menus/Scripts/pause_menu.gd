extends Control


func _on_resume_pressed() -> void:
	get_tree().paused = false


func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://UI Menus/Scenes/MainMenu.tscn")
