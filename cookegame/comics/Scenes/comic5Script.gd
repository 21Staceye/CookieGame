extends Node2D

@onready var panelList = get_node("panels").get_children()
@onready var num = len(panelList) - 2
var counter = 0
var voiceFinished = false
@onready var changer = get_node("whenToChange")


func _process(delta: float) -> void:
	panelList[counter].self_modulate.a += 0.5 * delta
	if (voiceFinished && counter == num + 1):
		get_tree().change_scene_to_file("res://comics/Scenes/comic6Scene.tscn")

func changePanel() -> void:
	if (counter != num+1):
		counter += 1


func _on_voice_line_finished() -> void:
	voiceFinished = true
