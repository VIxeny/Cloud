extends Node
var dificultyTime = 0
var arrayx = []
var cloudCount = 0
var x = 300
var y = 300
@export var cloudFly: PackedScene


func _ready() -> void:
	createCloud()
	createCloud()

func createCloud():
	cloudCount+=1
	var temp = cloudFly.instantiate()
	temp.position = Vector2(x, y)
	temp.scale = Vector2(1-cloudCount*0.05, 1)
	add_child(temp)
	x += randi_range(300, 700)
	y += randi_range(250, 500)
	

func _process(_delta: float) -> void:
	if $player.position.x > x - 1000:
		createCloud()
