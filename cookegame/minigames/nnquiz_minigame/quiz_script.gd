extends CanvasLayer

var incorrectCount = 0
var questionsList
var curQuestion

func _ready() -> void:
	questionsList = [$question01, $question02, $question03, $question04, $question05, $question06,
	$question07, $question08, $question09, $question10]
	curQuestion = questionsList.pop_at(0)
	curQuestion.visible = true

func _on_good_button_pressed() -> void:
	$confetti_particles.yippee()
	if len(questionsList) == 0:
		empy() 
	else:
		curQuestion.visible = false
		curQuestion = questionsList.pop_at(0)
		curQuestion.visible = true


func _on_evil_button_pressed() -> void:
	incorrectCount += 1
	Globals.cookieHealth -= 20
	if len(questionsList) == 0:
		empy() 
	else:
		curQuestion.visible = false
		curQuestion = questionsList.pop_at(0)
		curQuestion.visible = true
	
func empy():
	curQuestion.visible = false
	get_tree().change_scene_to_file("res://comics/Scenes/comic3Scene.tscn")
	#confetti
	
