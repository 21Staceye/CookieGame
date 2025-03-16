extends Node3D
@onready var worldScene = (self.get_parent())
@onready var player = worldScene.get_node("cookie")
var canTalk = false
var UIList = [$"../../../transitionsUI/transitionExample.tscn"]

func cookieInteract(body: Node3D) -> void:
	print("hi")
	if body.name == "cookie":
		canTalk = true
		
func cookieLeft(body: Node3D) -> void:
	print("bye")
	if body.name == "cookie":
		canTalk = false

					
func _process(delta) -> void:
	#print(player.name)
	if (Input.is_action_just_pressed("Interact") && canTalk == true):
		print("Well hi there")
		var group = self.get_groups()
		match group[0]:
			"sugar":
				pass
#				self.get_parent().add_child($"../../transitionsUI/transitionExample.tscn")
			"nnn":
				pass
			"chocolate":
				pass
		doDialogue()
				
func doDialogue():
		var cam = (player.get_node("Camera3D"))
		var camPos = (player.get_node("Camera3D")).position
		#camPos = camPos.lerp(Vector3(camPos.x, camPos.y + 1.5, camPos.z), delta * 5)
		camPos = (Vector3(camPos.x, camPos.y + 1.5, camPos.z))
		worldScene.add_child(UIList[0])
		
