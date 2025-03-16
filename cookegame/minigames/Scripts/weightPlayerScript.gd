extends CharacterBody3D

@onready var UIScene= get_node("../WeightUI")
@onready var push = UIScene.get_node("pusher")
@onready var goal = UIScene.get_node("goal")
@onready var top = (UIScene.get_node("meterArea/topBound")).get_position()
@onready var low = (UIScene.get_node("meterArea/lowBound")).get_position()

@onready var speed = (top.y - low.y) / 4
@export var isOverlapped = false
var score = 50

func capture_mouse():	#Use this whenever to grab the mouse - used on ready
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func release_mouse():	#Use whenever to let the player have their mouse back
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
func _ready():
	capture_mouse()		#Get mouse

func _process(delta):
	#print(score)
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		var pos = push.get_position() #something go up.
		if (pos.y >= top.y):
			push.move_local_y(speed * delta)
		
	if !Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		var pos = push.get_position() #something go down.
		if (pos.y <= low.y):
			push.move_local_y(-speed * 1.2 * delta)
			
	match isOverlapped:
		false:
			score -= 2 * delta
		true:
			score += 4 * delta
			
	if (score >= 100):
		print("YOU DID IT!!!")
