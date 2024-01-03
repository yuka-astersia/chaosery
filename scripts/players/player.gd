extends CharacterBody2D

@export var movement_speed: float = 350
var player_direction: Vector2

func _physics_process(delta):
		
	var movement_direction = Input.get_vector("move_left", "move_right", "move_top", "move_down")
	velocity = movement_direction * movement_speed
	
	move_and_slide()
	look_at(get_global_mouse_position())
	player_direction = (get_global_mouse_position() - position).normalized()
	
	if Input.is_action_just_pressed("attack"):
		shoot()

func shoot():
	pass
