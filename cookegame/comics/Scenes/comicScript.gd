extends Node2D

@onready var panelList = get_node("panels").get_children()
@onready var num = len(panelList) - 2
var counter = 0

@onready var changer = get_node("whenToChange")

func _process(delta: float) -> void:
	panelList[counter].self_modulate.a += 0.5 * delta
	if (Input.is_action_just_pressed("Interact") && counter == num + 1):
		get_tree().change_scene_to_file("res://main/world_root.tscn")

func changePanel() -> void:
	if (counter != num+1):
		counter += 1
