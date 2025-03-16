extends CanvasLayer

var incorrectCount = 0
var questionsList
var curQuestion

func _ready() -> void:
	questionsList = [$question01, $question02, $question03, $question04, $question05]
	curQuestion = questionsList.pop_at(randi_range(0, len(questionsList)-1))
	curQuestion.visible = true

func _on_good_button_pressed() -> void:
	$confetti_particles.yippee()
	if len(questionsList) == 0:
		empy() 
	else:
		curQuestion.visible = false
		curQuestion = questionsList.pop_at(randi_range(0, len(questionsList)-1))
		curQuestion.visible = true


func _on_evil_button_pressed() -> void:
	incorrectCount += 1
	if incorrectCount >=3:
		pass #die
	if len(questionsList) == 0:
		empy() 
	else:
		curQuestion.visible = false
		curQuestion = questionsList.pop_at(randi_range(0, len(questionsList)-1))
		curQuestion.visible = true
	
func empy():
	curQuestion.visible = false
	self.queue_free()
	#confetti
	
