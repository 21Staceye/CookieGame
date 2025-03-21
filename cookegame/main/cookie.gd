extends RigidBody3D
var rolling_force = 20

@export var isTalking = false
@export var freezePos = Vector3(0,0,0)

func _ready() -> void:
	$Camera3D.top_level = true
 
func _physics_process(delta: float) -> void:
	if (isTalking != true):
		$Camera3D.position = Vector3(self.position.x, self.position.y+0.842, self.position.z+2.318)
	
		if Input.is_action_pressed("Forward"):
			angular_velocity.z -= rolling_force*delta
		elif Input.is_action_pressed("Back"):
			angular_velocity.z += rolling_force*delta

		if angular_velocity.z > 10:
			angular_velocity.z = 10
	else:
		self.position = freezePos
		angular_velocity.z = 0
		
	if (self.global_position.z!=0.0):
		self.global_position.z == 0.0
	if(self.global_rotation_degrees.x!=0.0 or self.global_rotation_degrees.y!=0.0):
		self.global_rotation_degrees.x = 0.0
		self.global_rotation_degrees.y = 0.0
	
