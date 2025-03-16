extends Node3D
@onready var worldScene = (self.get_parent())
@onready var player = worldScene.get_node("cookie")

var canTalk = false
var isTalk = false
var whichGroup = -1 #0 for sugar, 1 for nnn, 2 for chocolate
var pastGroups = 0 #increment each time you successfully complete an interaction

@onready var UIList = worldScene.get_node("transUI").get_children()
@onready var camList = worldScene.get_node("camPositions").get_children()
var scenesList = ["res://test_erin/Scenes/sugarCookieMini.tscn", 
					"res://minigames//nnquiz_minigame/quiz_scene.tscn",
					"res://minigames/wieghtMinigame/Scenes/weightGame.tscn"]
var dialogues = []
var dialogueCounter = 0
var t = 0


func cookieInteract(body: Node3D) -> void:
	print("hi")
	if body.name == "cookie":
		canTalk = true
		
func cookieLeft(body: Node3D) -> void:
	print("bye")
	if body.name == "cookie":
		canTalk = false


func _process(delta) -> void:
	
	if (canTalk == true && isTalk == false):
		player.angular_velocity.z = 0
		#print("Well hi there")
		var group = self.get_groups()
		match group[0]:
			"sugar":
				whichGroup = 0
#				self.get_parent().add_child($"../../transitionsUI/transitionExample.tscn")
			"nnn":
				whichGroup = 1
			"chocolate":
				whichGroup = 2
		#self.get_parent().add_chilld(UIList[whichGroup])
		UIList[whichGroup].visible = true
		isTalk = true
		doDialogue(delta)
		
	if (Input.is_action_just_pressed("Interact") && canTalk == true):
		
		if (dialogueCounter == 0):
			get_tree().change_scene_to_file(scenesList[whichGroup])
		dialogues[dialogueCounter].visible = false 
		dialogueCounter -= 1		
		print(dialogueCounter)

func doDialogue(delta):
	var cam = (player.get_node("Camera3D"))
	var camPos = (player.get_node("Camera3D")).position
	t += delta
	cam.transform = cam.transform.interpolate_with(camList[whichGroup].transform, t)
	#camPos = camPos.lerp(Vector3(camPos.x, camPos.y + 1.5, camPos.z), delta * 5)
	#camPos = (Vector3(camPos.x, camPos.y + 1.5, camPos.z))
	#worldScene.add_child(UIList[0])
	dialogues = UIList[whichGroup].get_children()
	dialogueCounter = len(dialogues) - 1
	#print(dialogues)
