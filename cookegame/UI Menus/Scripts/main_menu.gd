extends Control
var done = false

func _on_play_button_pressed():
	$buttonHit.play()
	await $buttonHit.finished
	get_tree().change_scene_to_file("res://main/world_root.tscn")


func _on_quit_button_pressed() -> void:
	$buttonHit.play()
	await $buttonHit.finished
	get_tree().quit()


func _on_credits_button_pressed() -> void:
	$buttonHit.play()
	await $buttonHit.finished
	get_tree().change_scene_to_file("res://UI Menus/Scenes/Credits_menu.tscn")


func _on_button_hit_finished() -> void:
	done = true
	
