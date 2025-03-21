extends Control
var done = false

func _ready() -> void:
	Globals.cookiePosition = Vector3(0,0.5,0)
	Globals.cookieHealth = 100
	Globals.completes = 0

func _on_play_button_pressed():
	$buttonHit.play()
	await $buttonHit.finished
	get_tree().change_scene_to_file("res://comics/Scenes/comic1Scene.tscn")


func _on_quit_button_pressed() -> void:
	$buttonHit.play()
	await $buttonHit.finished
	get_tree().quit()



func _on_button_hit_finished() -> void:
	done = true
	


func _on_credits_button_2_pressed() -> void:
	$buttonHit.play()
	await $buttonHit.finished
	get_tree().change_scene_to_file("res://UI Menus/Scenes/Credits_menu.tscn")
