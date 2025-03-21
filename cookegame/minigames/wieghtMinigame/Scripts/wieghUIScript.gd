extends Control
@onready var player = $"../weightPlayer"
@onready var top = get_node("meterArea/topBound").get_position()
@onready var low = get_node("meterArea/lowBound").get_position()

@onready var timer = get_node("whenToMove")
@onready var changer = get_node("whenToChange")
@onready var goal = get_node("goal")

@onready var gudSprite = goal.get_node("goalSpriteGud")
@onready var badSprite = goal.get_node("goalSpriteBad")
@onready var prog = get_node("progBar")

var moving = true
var direction = 1
var speed = 120

func goalHit(area: Area2D) -> void:
	if (area.name == "pusher"):
		player.isOverlapped = true
		
		gudSprite.visible = true
		badSprite.visible = false
	
func goalMiss(area: Area2D) -> void:
	if (area.name == "pusher"):
		player.isOverlapped = false
		
		gudSprite.visible = false
		badSprite.visible = true

func _process(delta) -> void:
	prog.value = player.score
	
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
		speed = randf_range(120, 150)

func changeTimeout() -> void:
	changer.wait_time = randf_range(1, 5) #reset timer
	direction *= -1
