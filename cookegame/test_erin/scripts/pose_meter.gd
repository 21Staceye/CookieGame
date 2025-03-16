extends Control
var timerOut = false
var value = 0
var reached = false
var stop = false
var failed = false
var valueSize = 0.5
var max = 1.2
var maxRe = true
var minRe = false
func _process(delta):
	$triMov.mesh.size.x = valueSize
	# for the temp poses 
	if max == valueSize and stop == false:
		maxRe = false
		minRe = true
		valueSize-=0.1
	if valueSize == 0.4 and stop == false:
		minRe = false
		maxRe = true
		valueSize+=0.1
	if minRe == true and stop == false:
		valueSize-=0.1
	if maxRe == true and stop == false:
		valueSize+=0.1
		
		
	if stop == true:
		pass
	# pose metter 
	if timerOut == false or stop == false:
		if reached == false and stop == false:
			# pose metter 
			$PoseMeterr.value = value
			value+=1
		if value == 99:
			reached = true
			
	
		if reached == true and stop == false:
			$PoseMeterr.value = value
			value-=1
			if value == 0:
				reached = false
		
		

func _on_timer_timeout():
	timerOut = true
	stop = true
	failed = true


func _on_button_pressed():
	#stops the metter
	$Timer.paused = true
	stop = true
	value = value
