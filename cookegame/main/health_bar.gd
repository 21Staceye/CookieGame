extends Control

func _process(delta: float) -> void:
	if $TextureProgressBar.value != Globals.cookieHealth:
		$TextureProgressBar.value = Globals.cookieHealth
		
	if Globals.cookieHealth <= 0:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		get_tree().change_scene_to_file("res://UI Menus/Scenes/MainMenu.tscn")
		
