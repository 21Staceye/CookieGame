extends CharacterBody3D
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var speed = 2
func _physics_process(delta):
	var input_dir = Input.get_vector("Back", "Forward", "Jump", "goBck")	   #Our inputs
	var direction = (Vector3(input_dir.x, 0, 0))		#Get our direction by using the camera/mouse movement
	velocity.x = direction.x * speed  #Velocities
	if !input_dir:
		velocity.x = move_toward(velocity.x, 0, speed)	#Slow back down
	if not is_on_floor():
		velocity.y -= gravity * delta
	move_and_slide()	#Apply movement and qualify for collisions
