extends Control
var timerOut = false
var value = 0.0
var reached = false
func _process(delta):
	
	if timerOut == false:
		$CanvasLayer/HSlider.value = value
		value+=1.0
		if value == 99.0:
			reached = true
			
		print(reached)
		if reached == true:
			$CanvasLayer/HSlider.value = value
			value-=1.0
		
	
	else:
		value = 0
func _on_timer_timeout() -> void:
	timerOut = true
