extends Control
var timerOut = false
var value = 0
var stop = false
var failed = false
var passed = false
var poseNum = 0
var arraySteps = ["BalancePos","StandPos", "TipToesPos"]
var goal = arraySteps.pick_random()

func _process(delta):
	if failed == true or passed == true:
		await get_tree().create_timer(1.0).timeout
		get_tree().change_scene_to_file("res://main/world_root.tscn")
	elif poseNum == 3 and failed == true:
		await get_tree().create_timer(1.0).timeout
		get_tree().change_scene_to_file("res://main/world_root.tscn")
	else:
		# for the temp poses 
		if $Timer.get_time_left() > 0:
			var percentangeTime = (1-$Timer.get_time_left()/$Timer.get_wait_time())*100
			$PoseMeterr.value = percentangeTime
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
		if Input.is_action_just_pressed(goal) and poseNum <= 3:
				$happy.visible = true
				await get_tree().create_timer(1.0).timeout
				$happy.visible = false
				poseNum+=1
				stop = false
				value = 0
				$PoseMeterr.value = 0
				$Timer.start()
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
	
	
	if value == 99:
		stop = true
		failed = true
	
		
		

func _on_timer_timeout():
	print("timer")
	#time out for losing the mini game 
	timerOut = true
	stop = true
	failed = true
	
	$PoseMeterr.value += $Timer.wait_time
	$failed.visible = true
	$cookie1.visible = false
	$cookie2.visible = false
	$cookie.visible = true
	$cookie3.visible = false
	
	
