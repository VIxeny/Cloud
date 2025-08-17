extends Camera2D

@onready var player = $"../player"
@export var camera_x = 0
@export var camera_y = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	position = Vector2(camera_x, camera_y) + player.position
