extends Control
var timerOut = false
var value = 0
var stop = false
var failed = false
var passed = false
var valueSize = 0.5
var max = 1.2
var poseNum = 0
var arraySteps = ["BalancePos","StandPos", "TipToesPos"]
var goal = arraySteps.pick_random()
func _process(delta):
	if failed == true and poseNum < 2: # failed game 
		get_tree().change_scene_to_file("res://main/world_root.tscn")
	elif passed == true: # passed the game and moves to the world 
		get_tree().change_scene_to_file("res://main/world_root.tscn")
	else:
		$happy.visible = false
		# for the temp poses 
		if goal == "BalancePos":
			$cookieSugar2.visible = false
			$cookieSugar3.visible = false
			$cookieSugar.visible = false
			$cookieSugar1.visible = true
		if goal == "StandPos":
			$cookieSugar3.visible = false
			$cookieSugar1.visible = false
			$cookieSugar.visible = false
			$cookieSugar2.visible = true
		if goal == "TipToesPos":
			$cookieSugar1.visible = false
			$cookieSugar2.visible = false
			$cookieSugar.visible = false
			$cookieSugar3.visible = true
		if Input.is_action_just_pressed("BalancePos"):
			$cookie2.visible = false
			$cookie3.visible = false
			$cookie.visible = false
			$cookie1.visible = true
		if Input.is_action_just_pressed("StandPos"):
			$cookie1.visible = false
			$cookie3.visible = false
			$cookie.visible = false
			$cookie2.visible = true
		if Input.is_action_just_pressed("TipToesPos"):
			$cookie1.visible = false
			$cookie2.visible = false
			$cookie.visible = false
			$cookie3.visible = true
		if Input.is_action_just_pressed(goal) and poseNum < 3 and stop == false:
				$happy.visible = true
				
				poseNum+=1
				stop = false
				value = 0
				$PoseMeterr.value = 0
				goal = arraySteps.pick_random()
					
	if poseNum >= 3:
		stop = true
		$happy.visible = true
		$cookie1.visible = false
		$cookie2.visible = false
		$cookie.visible = true
		$cookie3.visible = false
		$PoseMeterr.visible = false
		passed = true
	# pose metter 
	if timerOut == false or stop == false:
		if stop == false:
			# pose metter 
			$PoseMeterr.value = value
			value+=0.3
	if value == 99:
		stop = true
		failed = true
		
		
		

func _on_timer_timeout():
	#time out for losing the mini game 
	timerOut = true
	stop = true
	failed = true
	$PoseMeterr.value = 100
	$failed.visible = true
	$cookie1.visible = false
	$cookie2.visible = false
	$cookie.visible = true
	$cookie3.visible = false
	
	
