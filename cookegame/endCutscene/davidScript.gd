extends Node2D

@onready var bigList = get_node("bigDavidHolder").get_children()
@onready var lilList = get_node("littleDavidHolder").get_children()
var lilCur = 0
var lilMod = -1
var bigCur = 3
var bigMod = 1

var ending = false

var smoved = false

func _process(delta: float) -> void:
	#print(bigList[bigCur].position.x)
	if (ending != true):
		bigList[bigCur].position.x += 40 * delta * bigMod
		lilList[lilCur].position.x += 70 * delta * lilMod
		smoved = true
		
		if ( 1550 < bigList[bigCur].position.x) || (bigList[bigCur].position.x < -300):
			leftBoundary(bigList[bigCur])
			smoved = false
		if	( 1400 < lilList[lilCur].position.x) || (lilList[lilCur].position.x < -200):
			leftBoundary(lilList[lilCur])
			smoved = false
		
	if (Input.is_action_just_pressed("Interact")):
		#insert hannah voice line here
		get_node("endingTimer").start()
		ending = true
		
	if (ending == true):
		$monologue.stop()
		bigList[bigCur].self_modulate.a -= 0.5 * delta
		lilList[lilCur].self_modulate.a -= 0.5 * delta
		

func leftBoundary(body: Node) -> void:
	var rand = randi_range(0, 3)
	print("tradesies")
	if body.get_parent() == get_node("bigDavidHolder"):
		body.position.x -= 50 * bigMod
		if (rand != bigCur):
			bigCur = rand
		else:
			bigCur = 2
		checkDir(0)
			
	if body.get_parent() == get_node("littleDavidHolder"):
		body.position.x += 50 * lilMod
		if (rand != lilCur):
			lilCur = rand
		else:
			lilCur = 2
		checkDir(1)
		
func checkDir(whichGroup: int):	#0 for big, 1 for little
	var pos
	match whichGroup:
		0:
			pos = bigList[bigCur]
			if (pos.position.x <= -300):
				bigMod = 1
				pos.position.x = -300
			else:
				bigMod = -1
				pos.position.x = 1550
		1:
			pos = lilList[lilCur]
			if (pos.position.x <= -200):
				lilMod = 1
				pos.position.x = -200
			else:
				lilMod = -1
				pos.position.x = 1400
	
func ended() -> void:
	get_tree().change_scene_to_file("res://UI Menus/Scenes/MainMenu.tscn")
