extends CharacterBody3D
var playerInSight : bool
var rng = RandomNumberGenerator.new()
enum States{
	fly,
	walking,
	scared 
}
var curState: States
var SPEED = 0.2
var angle = 15
func _ready() -> void:
	curState = States.fly
		
	
	




func _process(delta: float) -> void:
	
	if curState == States.fly:
		global_position.y=SPEED

func _integrate_forces(state):
	state.transform = state.transform.rotated(angle)
	
