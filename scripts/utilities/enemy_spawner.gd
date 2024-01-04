extends Node2D

var enemies_container: Node2D
var max_enemies: int = 10
var can_spawn_enemy: bool = true
var player: CharacterBody2D
var game_menu: Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var score = int($"../GameCanvas/UserScoreContainer/ScoreValue".text)
	
	if enemies_container.get_child_count() < max_enemies and can_spawn_enemy:
		# For now, the only enemy we gonna use is eyeball
		var enemy_resource = load("res://scenes/enemies/eyeball.tscn")
		var enemy_instance = enemy_resource.instantiate()
		enemy_instance.target = player
		enemy_instance.scale = player.scale
		enemy_instance.game_menu = game_menu
		enemy_instance.hp = int(score % 25)
		enemy_instance.position = player.position + Vector2(250, 0).rotated(randf_range(0, 2*PI))
		
		enemies_container.add_child(enemy_instance)
		can_spawn_enemy = false




func _on_spawner_timer_timeout():
	can_spawn_enemy = true
