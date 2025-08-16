extends Node

@onready var restart_menu = get_tree().current_scene.get_node("restart_menu")

var highestScore = 0
var currentScore = 0


func add_score():
	currentScore += 1
	print(currentScore)

func game_over():
	if currentScore > highestScore:
		highestScore = currentScore
	restart_menu.get_node("highest").text = "Highest score: " + str(highestScore)
	restart_menu.get_node("current").text = "Current score: " + str(currentScore)
	restart_menu.visible = true
	print("Current Score = ", currentScore)
	print("Highest Score = ", highestScore)
	
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
