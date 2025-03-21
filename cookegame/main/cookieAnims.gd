extends Node3D

@onready var sugar1 = get_node("sugZone/SugarCookie/AnimationPlayer")
@onready var sugar2 = get_node("sugZone/SugarCookie2/AnimationPlayer")
@onready var choc2 = get_node("chocZone/ChocolateChip(2)/AnimationPlayer")
@onready var choc3 = get_node("chocZone/ChocolateChip(3)/AnimationPlayer")

@onready var player = get_parent().get_node("cookie")
var lastState = false

func _ready() -> void:
	sugar1.play("SugarIdle")
	sugar2.play("Sugar2_Idle")
	choc2.play("ChocolateChip(2)_Idle")
	choc3.play("ChocolateChip(3)_Idle")

func _process(delta) -> void:
	if (lastState == false && player.isTalking == true):
		changeToTalk()
	lastState = player.isTalking
	
func changeToTalk():
	print("time to yap")
	#for a in animList:
	#	a.play("Talk")
