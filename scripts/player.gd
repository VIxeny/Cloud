extends RigidBody2D

var debug = false

var on_ground = false
var preparing = false
var direction = Vector2(0.5, -1)
var time = 0
var newJump = true

@onready var bar = $bar

@export var power: Curve

func debug_function(text):
	if debug:
		print(text)
		
func _ready() -> void:
	print(power.get_point_position(1).x)

func _process(delta: float) -> void:
	if Input.is_action_pressed("jump") and on_ground and newJump:
		debug_function("jump")
		preparing = true
		time += delta
		bar.visible = true
		bar.get_node("foreBar").scale.x = time / power.get_point_position(1).x
	elif preparing:
		jump()
	
	if time >= power.get_point_position(1).x:
		jump()
	
	if Input.is_action_just_released("jump"):
		newJump = true



func jump():
	preparing = false
	bar.visible = false
	newJump = false
	apply_impulse(direction * power.sample(time))
	time = 0
	print(direction * power.sample(time))

func _on_ground_zone_body_entered(body: Node2D) -> void:
	on_ground = true

func _on_ground_zone_body_exited(body: Node2D) -> void:
	on_ground = false
	preparing = false
	bar.visible = false
	time = 0            
