extends RigidBody3D
var rolling_force = 20

func _ready() -> void:
	$Camera3D.top_level = true
 
func _physics_process(delta: float) -> void:
	$Camera3D.position = Vector3(self.position.x, self.position.y, self.position.z+2)
	
	if Input.is_action_pressed("Forward"):
		angular_velocity.z -= rolling_force*delta
	elif Input.is_action_pressed("Back"):
		angular_velocity.z += rolling_force*delta

	if angular_velocity.z > 10:
		angular_velocity.z = 10
