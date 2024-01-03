extends Node2D

signal change_scene(scene_name)

@onready var projectiles_container: Node2D = $ProjectilesContainer
@onready var score_value: Label = $GameCanvas/UserScoreContainer/ScoreValue
@onready var enemy_spawner: Node2D = $EnemySpawner
@onready var score_manager: Node2D = $ScoreManager

func _ready():
	enemy_spawner.enemies_container = $EnemiesContainer
	enemy_spawner.player = $Player
	enemy_spawner.game_menu = self

func _on_player_shoot(projectiles):
	projectiles_container.add_child(projectiles)

func _process(delta):
	pass
	
func add_score(score):
	score_value.text = str(int(score_value.text) + score)


func _on_player_die():
	score_manager.save_score("New Score", score_value.text)
	
	change_scene.emit("menus/leaderboard_menu")
