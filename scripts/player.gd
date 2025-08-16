extends RigidBody2D

var debug = false

var on_ground = false
var preparing = false
var direction = Vector2(0.5, -1)
var time = 0
var newJump = true
var game_over = false

var previous_cloud = null

@onready var bar = $"mount/bar"

@export var power: Curve

func debug_function(text):
	if debug:
		print(text)

func _process(delta: float) -> void:
	if $"..".y + 300 < position.y and not game_over:
		game_over = true
		Score.game_over()
	
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

func _on_ground_zone_body_entered(body: Node2D) -> void:
	if body.is_in_group("ground"):
		on_ground = true
		if body != previous_cloud and previous_cloud:
			Score.add_score()
		previous_cloud = body
		

func _on_ground_zone_body_exited(body: Node2D) -> void:
	if body.is_in_group("ground"):
		on_ground = false
		preparing = false
		bar.visible = false
		time = 0            
