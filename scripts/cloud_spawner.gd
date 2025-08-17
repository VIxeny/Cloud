extends Node
var dificultyTime = 0
var arrayx = []
var cloudCount = 0
var x = 300
var y = 300
@export var cloudFly: PackedScene


func _ready() -> void:
	Score.restart_menu = get_node("restart_menu")
	Score.currentScore = 0
	Score.in_game_screen = get_node("in_game_screen")
	createCloud()
	createCloud()

func createCloud():
	cloudCount+=1
	var temp = cloudFly.instantiate()
	temp.position = Vector2(x, y)
	temp.scale = Vector2(1-cloudCount*0.05, 1)
	add_child(temp)
	x += randi_range(300, 500)
	y += randi_range(100, 200)
	

func _process(_delta: float) -> void:
	if $player.position.x > x - 1000:
		createCloud()
