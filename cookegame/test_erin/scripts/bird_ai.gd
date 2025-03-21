extends CharacterBody3D

@onready var navigation_agent_3d = $NavigationAgent3D
@onready var MonsterRef
var playerInSight : bool
var rng = RandomNumberGenerator.new()
enum States{
	walking,
	pickedup,
	waiting
}
#@onready var MonsterRef
var curState: States
var SPEED = 1.0

#@export var speed = 3
var move_vec = Vector3(rng.randf_range(-1.0,1.0),global_position.y,global_position.z)
var speed = 1
var waypointIndex : int = 0
var waypointIndexCage : int = 0
@export var baseSpeed = 2

@export var pickedup = false
var wonderAway = false
var count = 0
var pickup = 0
var cageCount = 0

func _ready():
	curState = States.walking
	
	
func _process(delta):
	if curState == States.walking:
		var velocity = move_vec*speed*delta
		translate(velocity)
		
		
		
func moveTowardsPoint(delta, speed):
	move_and_slide()

	
		
func get_rand_point(radius:float) -> Vector3:
	var x1 = randi_range(-1,1)
	var x2 = randi_range(-1,1)
	while x1 * x1 + x2 *x2  >= 1:
		x1 = randi_range(-1,1)
		x2 = randi_range(-1,1)
	var rand_sphere = Vector3(
		2 * x1 * sqrt(1-x1*x1 - x2*x2),
		2 * x2 * sqrt(1-x1*x1-x2*x2),
		1-2*(x1*x1 + x2*x2))
	return rand_sphere * randi_range(0,radius)
	

func _on_timer_timeout() -> void:	
		curState = States.walking
