extends Control
@onready var player = $"../weightPlayer"
@onready var top = get_node("meterArea/topBound").get_position()
@onready var low = get_node("meterArea/lowBound").get_position()

@onready var timer = get_node("whenToMove")
@onready var changer = get_node("whenToChange")
@onready var goal = get_node("goal")
var moving = true
var direction = 1
var speed = 100

func goalHit(area: Area2D) -> void:
	if (area.name == "pusher"):
		player.isOverlapped = true
		print("who up overlapping")
	
func goalMiss(area: Area2D) -> void:
	if (area.name == "pusher"):
		player.isOverlapped = false
		print("not you")

func _process(delta) -> void:
	if (moving == true):
		if (low.y <= goal.position.y): #if out of bounds 
			direction = 1		#go other way
		if (top.y >= goal.position.y): #if out of bounds 
			direction = -1		#go other way
		goal.move_local_y(-speed * delta * direction) #move the goal


func timeout() -> void:
	timer.wait_time = randf_range(2,2.5) #reset timer.
	if (moving == false):
		#print("SCHMOOVE")
		moving = true #set moving true
	else:
		#print("no schmoove")
		moving = false #no moving
		direction *= -1 #change our direction
		speed = randf_range(90, 120)

func changeTimeout() -> void:
	changer.wait_time = randf_range(1, 5) #reset timer
	direction *= -1
