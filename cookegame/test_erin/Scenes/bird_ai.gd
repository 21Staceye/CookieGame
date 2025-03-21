extends Node2D
@onready var navigation_agent_3d = $NavigationAgent2D
var playerInSight : bool 
var rng = RandomNumberGenerator.new()
enum States{
	fly,
	scared,
	walking
}
var curState: States
var SPEED = 1.0
@export var Waypoints : Array[Marker3D]
var waypointIndex : int = 0
var flyAway = false
var count = 0
var pickup = 0
func _ready():
	curState = States.fly
func _process(delta: float) -> void:
	if curState == States.fly:
		
		
	if curState == States.scared:
		pass
	if curState = States.walking:
		pass
