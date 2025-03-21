extends CharacterBody3D
@onready var navigation_agent_3d = $NavigationAgent3D
@onready var MonsterRef
var playerInSight : bool
var rng = RandomNumberGenerator.new()
enum States{
	patrol,
	pickedup,
	waiting
}
#@onready var MonsterRef
var curState: States
var SPEED = 1.0
var caged = false
#@export var speed = 3
@export var Waypoints : Array[Marker3D]
@export var WaypointsCage : Array[Marker3D]
var waypointIndex : int = 0
var waypointIndexCage : int = 0
@export var baseSpeed = 2
var speed = baseSpeed
@export var pickedup = false
var wonderAway = false
var count = 0
var pickup = 0
var cageCount = 0

func _ready():
	if(!caged):
		navigation_agent_3d.set_target_position(Waypoints[waypointIndex].global_position)
	if(caged):
		navigation_agent_3d.set_target_position(Waypoints[waypointIndex].global_position)

	
	
func _process(delta):
	
	
	if(caged == true):
		
		navigation_agent_3d.set_target_position(WaypointsCage[waypointIndexCage].global_position)
	if(pickedup == true):
		
		
		pickup+=1
		curState = States.pickedup
	if(curState != States.pickedup and pickedup == false):
		speed = move_toward(speed, baseSpeed, 3 * delta)

	match curState:
		
		States.patrol:
			if(caged):
				navigation_agent_3d.set_target_position(WaypointsCage[waypointIndexCage].global_position)
			if (navigation_agent_3d.is_navigation_finished()):
				
				curState = States.waiting
				
				$Timer.start()
				return
			moveTowardsPoint(delta,speed)
			
			pass
		
		States.pickedup:
			#have animation and stop moving dino 
			
			self.rotation.y = 90
			SPEED = 0
			speed = 0
			
			
				
			pass
		
		
			moveTowardsPoint(delta,speed)

		States.waiting:
			pass


func moveTowardsPoint(delta, speed):
	#print(WaypointsCage[waypointIndexCage].postion, "going")
	var targetPos = navigation_agent_3d.get_next_path_position()
	
	var dir = global_position.direction_to(targetPos)

	look_at(Vector3(targetPos.x,targetPos.y,targetPos.z),Vector3.UP)
	velocity = dir * speed
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
		curState = States.patrol
		waypointIndex+=1
		if(waypointIndex > Waypoints.size()-1):
			waypointIndex = 0
		navigation_agent_3d.set_target_position(Waypoints[waypointIndex].global_position)
