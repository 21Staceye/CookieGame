extends Node3D
@onready var worldScene = get_tree().root.get_child(0)
@onready var player = worldScene.get_node("cookie")
@onready var camMover = worldScene.get_node("camPositions")
@onready var camMain = camMover.get_node("transCam")

var canTalk = false	#Use to signal when we're by a cookie group
var isTalk = false	#Use to signal if we've begun interaction
var whichGroup = -1 #0 for sugar, 1 for nnn, 2 for chocolate

@onready var UIList = worldScene.get_node("transUI").get_children()
@onready var camList = worldScene.get_node("camPositions").get_children()
var scenesList = ["res://test_erin/Scenes/sugarCookieMini.tscn", 
					"res://minigames//nnquiz_minigame/quiz_scene.tscn",
					"res://minigames/wieghtMinigame/Scenes/weightGame.tscn"]
var dialogues = []	#Modified later to add dialogue text boxes to an array
var dialogueCounter = 0	 #Modified later to know how many text boxes there are left

func cookieInteract(body: Node3D) -> void:
	if body.name == "cookie":
		canTalk = true
		
func cookieLeft(body: Node3D) -> void:
	if body.name == "cookie":
		canTalk = false

func _process(delta) -> void:
	
	if (canTalk == true && isTalk == false):	#Need to check both since canTalk will stay true
		var group = self.get_groups()			#but all this should only happen once
		match group[0]:
			"sugar":
				whichGroup = 0
			"nnn":
				whichGroup = 2
			"chocolate":
				whichGroup = 1
		if (player.completes == whichGroup):	#Makes sure we talk to the groups in order
			UIList[whichGroup].visible = true	#Make corresponding UI visible
			isTalk = true
			player.isTalking = true
			player.freezePos = player.position
			doDialogue(delta)
		
	if (Input.is_action_just_pressed("Interact") && canTalk == true):
		if (dialogueCounter == 0):
			get_tree().change_scene_to_file(scenesList[whichGroup])	#After going thru all the transitions, change to minigame
		dialogues[dialogueCounter].visible = false #Each time u interact go to the next box
		dialogueCounter -= 1				#by hiding the one on top of it
		print(dialogueCounter)

func doDialogue(delta):
	camMover.transition_camera(player.get_node("Camera3D"), camList[whichGroup], 2) #Does tweening
	dialogues = UIList[whichGroup].get_children() #Gets the corresponding text box list
	dialogueCounter = len(dialogues) - 1	#And its length
