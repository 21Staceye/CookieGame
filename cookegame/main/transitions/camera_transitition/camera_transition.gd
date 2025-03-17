extends Node

@onready var theCam = self.get_node("transCam")
@onready var transTime = $transTime

var curTo
var curFrom

var transitioning: bool = false

func _ready() -> void:
	theCam.current = false
	
func _process(delta) -> void:
	pass

func switch_camera() -> void:
	curFrom.current = false
	curTo.current = true
	transitioning=false

func transition_camera(from: Camera3D, to: Camera3D, duration: float = 1.0) -> void:
	if transitioning: return	#Dont do this if tweening is already active
	curTo = to
	curFrom = from
	var tween = create_tween()
	
	# Copy the parameters of the first camera
	theCam.fov = from.fov
	theCam.cull_mask = from.cull_mask
	
	# Move our transition camera to the first camera position
	theCam.global_transform = from.global_transform
	
	# Make our transition camera current
	theCam.current = true
	
	#tween it
	transitioning = true
	tween.tween_property(theCam, "global_transform", to.global_transform, duration)
	
	#start timer
	transTime.start(duration)

func timeout() -> void:
	# Make the second camera current
	curTo.current = true
	transitioning = false
