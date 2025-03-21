extends Node2D

@onready var panelList = get_node("panels").get_children()
@onready var num = len(panelList) - 2
var counter = 0
@export var voiceFinished:bool = false
@onready var changer = get_node("whenToChange")
@export var sceneToChangeTo:PackedScene

func _process(delta: float) -> void:
	panelList[counter].self_modulate.a += 0.5 * delta
	if (voiceFinished && counter == num + 2):
		get_tree().change_scene_to_packed(sceneToChangeTo)

func changePanel() -> void:
	if (counter != num+2):
		counter += 1


func _on_voice_line_finished() -> void:
	voiceFinished = true
