extends Node

@onready var theCam = self.get_node("transCam")
#@onready var tween: Tween = get_tree().create_tween()
@onready var transTime = $transTime

var curTo
var curFrom

var transitioning: bool = false

func _ready() -> void:
	theCam.current = false
	
func _process(delta) -> void:
	if (transitioning == true):
		print(transTime.time_left)
		var pos = theCam.position
		#pos = pos.move_toward(curTo.position, delta * 0.5)

func switch_camera() -> void:
	curFrom.current = false
	curTo.current = true
	transitioning=false


func transition_camera(from: Camera3D, to: Camera3D, duration: float = 1.0) -> void:
	if transitioning: return
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
	
	transitioning = true
	# Move to the second camera, while also adjusting the parameters to
	# match the second camera
#	tween.remove_all()	#theCam, "global_transform", t
	tween.tween_property(theCam, "global_transform", to.global_transform, duration)
	#theCam.position.move_toward(to.position, duration)
	#tween.connect("finished", switch_camera)
	#tween.tween_property(theCam, "fov", to.fov, duration)
	#tween.play()
	transTime.start(duration)
	
	# Wait for the tween to complete
	#await tween.finished
	#tween.tween_callback(switch_camera)


func timeout() -> void:
	print("timeOUT")
	# Make the second camera current
	curTo.current = true
	transitioning = false
