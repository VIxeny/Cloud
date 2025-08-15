extends Node
var dificultyTime = 0
var arrayx = []
var shipCount = 1
@export var cloudFly: PackedScene


func _on_timer_timeout() -> void:
	print("!")
	var temp = cloudFly.instantiate()
	temp.position = Vector2(100, 300)

	add_child(temp)
	temp = cloudFly.instantiate()
	temp.position = Vector2(300, 500)
	add_child(temp)
