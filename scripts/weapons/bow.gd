extends Node2D

signal shoot(projectiles: Area2D)

@onready var projectile_spawn_point: Marker2D = $ProjectileSpawnPoint

var player: CharacterBody2D
var can_attack: bool = true

func _process(delta):
	
	if Input.is_action_just_pressed("attack") and can_attack:
		print("Attack")
		shoot.emit(create_projectiles())
		can_attack = false

func create_projectiles():
	var arrow_resource = load("res://scenes/projectiles/arrow.tscn")
	var arrow_instance = arrow_resource.instantiate()
	
	print(player.scale)
	
	arrow_instance.scale = player.scale
	arrow_instance.position = projectile_spawn_point.global_position
	arrow_instance.rotation_degrees = rad_to_deg(player.player_direction.angle()) + 90
	arrow_instance.travel_direction = player.player_direction
	
	return arrow_instance


func _on_attack_cooldown_timeout():
	can_attack = true
