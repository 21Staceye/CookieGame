extends Control

func _process(delta: float) -> void:
	get_tree().paused = false
func _on_resume_pressed() -> void:
	$buttonClick.play()
	await $buttonClick.finished
	get_tree().paused = false


func _on_main_menu_pressed() -> void:
	$buttonClick.play()
	await $buttonClick.finished
	get_tree().change_scene_to_file("res://UI Menus/Scenes/MainMenu.tscn")


func _on_main_menu_2_pressed() -> void:
	$buttonClick.play()
	await $buttonClick.finished
	get_tree().quit()
