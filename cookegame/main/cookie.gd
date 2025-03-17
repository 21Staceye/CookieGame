extends RigidBody3D
var rolling_force = 20

@export var completes = 0 #increment this each time you finish a minigame

func _ready() -> void:
	$Camera3D.top_level = true
 
func _physics_process(delta: float) -> void:
	var talking = self.get_parent().get_node("TransitionBox").isTalk
	print(talking)
	if (talking != true):
		$Camera3D.position = Vector3(self.position.x, self.position.y+0.842, self.position.z+2.318)
		
		if Input.is_action_pressed("Forward"):
			angular_velocity.z -= rolling_force*delta
		elif Input.is_action_pressed("Back"):
			angular_velocity.z += rolling_force*delta

		if angular_velocity.z > 10:
			angular_velocity.z = 10
			
	else:
		self.position = self.get_parent().get_node("TransitionBox").playerFreeze
		angular_velocity.z = 0
