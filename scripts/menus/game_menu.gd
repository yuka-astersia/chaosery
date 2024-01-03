extends Node2D

@onready var projectiles_container: Node2D = $ProjectilesContainer

func _on_player_shoot(projectiles):
	projectiles_container.add_child(projectiles)
