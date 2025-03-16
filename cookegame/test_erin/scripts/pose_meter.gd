extends Control
var timerOut = false
var value = 0
var stop = false
var failed = false
var valueSize = 0.5
var max = 1.2
var poseNum = 0
var arraySteps = ["BalancePos","StandPos", "TipToesPos"]
var goal = arraySteps.pick_random()
func _process(delta):
	$triMov.mesh.size.x = valueSize
	# for the temp poses 
	if goal == "BalancePos":
		valueSize = 1.2
	if goal == "StandPos":
		valueSize = 0.5
	if goal == "TipToesPos":
		valueSize = 0.2
	if Input.is_action_just_pressed(goal) and poseNum < 3:
			stop = true
			poseNum+=1
			stop = false
			value = 0
			$PoseMeterr.value = 0
			goal = arraySteps.pick_random()
			$/root/SugarCookieMini/player.mesh.size.x = valueSize
	if poseNum >= 3:
		print("won")
		stop = true
	# pose metter 
	if timerOut == false or stop == false:
		if stop == false:
			# pose metter 
			$PoseMeterr.value = value
			value+=0.1
		if value == 99:
			stop = true
		
		
		

func _on_timer_timeout():
	#time out for losing the mini game 
	timerOut = true
	stop = true
	failed = true
	print("failed")
