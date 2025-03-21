extends Node3D

@onready var sugar1 = get_node("sugZone/SugarCookie/AnimationPlayer")
@onready var sugar2 = get_node("sugZone/SugarCookie2/AnimationPlayer")
@onready var choc2 = get_node("chocZone/ChocolateChip(2)/AnimationPlayer")
@onready var choc3 = get_node("chocZone/ChocolateChip(3)/AnimationPlayer")
@onready var choc = get_node("chocZone/ChocolateChip/AnimationPlayer")
@onready var nnn1 = get_node("nnnZone/N&NCookie/AnimationPlayer")
@onready var nnn2 = get_node("nnnZone/N&NCookie(2)/AnimationPlayer")

func _ready() -> void:
	sugar1.play("SugarIdle")
	sugar2.play("Sugar2_Idle")
	choc.play("ChocolateIdle(1)")
	choc2.play("ChocolateChip(2)_Idle")
	choc3.play("ChocolateChip(3)_Idle")
	nnn1.play("N&Ncookie_Idle")
	nnn2.play("N&NCookie_Idle(2)")	
