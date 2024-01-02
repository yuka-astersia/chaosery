extends CharacterBody2D

signal die

@export var hp: int = 100
@export var movement_speed: float = 250
@onready var score_manager = $ScoreManager

var can_laser: bool = true
var projectile_type: PackedScene
var player_direction: Vector2

func _physics_process(delta):
	
	var movement_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = movement_direction * movement_speed
	
	move_and_slide()
	look_at(get_global_mouse_position())
	player_direction = (get_global_mouse_position() - position).normalized()
	if Input.is_action_just_pressed("attack"):
		shoot()


func shoot():
	var parent = get_parent()
	
	var projectiles_container = parent.get_child(3)
	var projectile_resource = load("res://scenes/projectiles/laser.tscn")
	var projectile = projectile_resource.instantiate()
	
	var selected_spawn_point = $BulletMarker.global_position
	
	projectile.position = selected_spawn_point
	projectile.travel_direction = player_direction
	projectile.rotation_degrees = rad_to_deg(player_direction.angle()) + 90
	projectile.scale = scale * .25
	
	projectiles_container.add_child(projectile)

func game_over(): 
	var score = get_parent().get_child(2).get_child(3).text
	var parent = get_parent().get_parent().get_parent()
	
	parent.open_leaderboard()
	
	score_manager.save_score(score, 'Unnamed')
	
	print("Game over")
