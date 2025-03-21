extends CharacterBody3D

@onready var UIScene= get_node("../WeightUI")
@onready var push = UIScene.get_node("pusher")
@onready var goal = UIScene.get_node("goal")
@onready var top = (UIScene.get_node("meterArea/topBound")).get_position()
@onready var low = (UIScene.get_node("meterArea/lowBound")).get_position()

@onready var speed = (top.y - low.y) / 4
@export var isOverlapped = false
@export var score = 25

func capture_mouse():	#Use this whenever to grab the mouse - used on ready
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func release_mouse():	#Use whenever to let the pl0ayer have their mouse back
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
func _ready():
	capture_mouse()		#Get mouse
	get_parent().get_node("ChocolateChip(2)/AnimationPlayer").play("ChocolateChip(2)_Idle")
	get_node("RaisinCookieNew/Raisin_Cookie/Skeleton3D/N&N_Paint").visible = false
	get_node("RaisinCookieNew/AnimationPlayer").play("Raisin_Idle")

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
			score -= 4 * delta
			Globals.cookieHealth -= delta
			
		true:
			score += 4 * delta

	if (score >= 100):
		get_tree().change_scene_to_file("res://comics/Scenes/comic3Scene.tscn")
	if (score <= 0):
		get_tree().change_scene_to_file("res://main/world_root.tscn")
