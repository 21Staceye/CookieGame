extends Node3D

@onready var sugar1 = get_node("sugZone/SugarCookie/AnimationPlayer")
@onready var sugar2 = get_node("sugZone/SugarCookie2/AnimationPlayer")

@onready var animList = [sugar1, sugar2]

@onready var player = get_parent().get_node("cookie")
var lastState = false

func _ready() -> void:
	#for a in animList:
	#	a.play("Idle")
	sugar1.play("SugarIdle")
	sugar2.play("Sugar2_Idle")

func _process(delta) -> void:
	if (lastState == false && player.isTalking == true):
		changeToTalk()
	lastState = player.isTalking
	
func changeToTalk():
	print("time to yap")
	#for a in animList:
	#	a.play("Talk")
