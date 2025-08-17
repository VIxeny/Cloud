extends Node

var restart_menu
var in_game_screen

var highestScore = 0
var currentScore = 0


func add_score():
	currentScore += 1
	in_game_screen.get_node("label").text = "Current score: " + str(currentScore)
	print(currentScore)

func game_over():
	if currentScore > highestScore:
		highestScore = currentScore
	restart_menu.get_node("highest").text = "Highest score: " + str(highestScore)
	restart_menu.get_node("current").text = "Current score: " + str(currentScore)
	restart_menu.visible = true
	LoseSound.play()
	print("Current Score = ", currentScore)
	print("Highest Score = ", highestScore)
	
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
