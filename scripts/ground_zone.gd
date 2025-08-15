extends Node2D

@onready var rigibody: RigidBody2D = $".."

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotation = -rigibody.rotation
