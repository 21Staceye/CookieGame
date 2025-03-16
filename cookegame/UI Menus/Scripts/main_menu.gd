extends Control


func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://main/world_root.tscn")


func _on_quit_button_pressed() -> void:
	get_tree().quit()


func _on_credits_button_pressed() -> void:
	get_tree().change_scene_to_file("res://UI Menus/Scenes/Credits_menu.tscn")
