extends Control




func _on_back_pressed() -> void:
	$clickingButton.play()
	await $clickingButton.finished
	get_tree().change_scene_to_file("res://UI Menus/Scenes/MainMenu.tscn")


func _on_next_pressed() -> void:
	$clickingButton.play()
	await $clickingButton.finished
	$image.visible = false
	$page2.visible = true
