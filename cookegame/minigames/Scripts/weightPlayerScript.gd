extends CharacterBody3D
@onready var pushIcon = $"../weightUI/pushIcon"
@onready var push = get_node("minigames/Scenes/weightUI/pushIcon")

func capture_mouse():	#Use this whenever to grab the mouse - used on ready
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func release_mouse():	#Use whenever to let the player have their mouse back
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
func _ready():
	capture_mouse()		#Get mouse

func _process(delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		var pos = pushIcon.get_position() #something go up.
		if (pos.y > -45):
			pushIcon.set_position(Vector2(pos.x, pos.y + 3))
		
	if !Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		var pos = pushIcon.get_position() #something go down.
		if (pos.y < 315):
			pushIcon.set_position(Vector2(pos.x, pos.y - 3))
