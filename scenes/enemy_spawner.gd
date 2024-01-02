extends Node2D

@export var max_enemy_number: int = 0

var spawner_in_cooldown: int = false
@onready var player = get_parent().get_parent().get_parent().get_child(1)
@onready var enemies_container: Node2D = $"../EnemiesContainer"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if enemies_container.get_child_count() <= max_enemy_number and not spawner_in_cooldown:	
		
		var enemies: Array = [
			preload("res://scenes/enemies/bat.tscn")
		]
		
		var enemy: CharacterBody2D = enemies[randi() % enemies.size()].instantiate()
		enemy.position = player.position + Vector2(250, 0).rotated(randf_range(0, 2*PI))
		enemy.scale = player.scale * .25
		enemy.target = player
		enemies_container.add_child(enemy)
		$SpawnerTimer.start()
		spawner_in_cooldown = true

func _on_spawner_timer_timeout():
	spawner_in_cooldown = false
