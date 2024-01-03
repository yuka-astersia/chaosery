extends Node2D

@onready var projectiles_container: Node2D = $ProjectilesContainer
@onready var score_value: Label = $GameCanvas/UserScoreContainer/ScoreValue

func _on_player_shoot(projectiles):
	projectiles_container.add_child(projectiles)

func _process(delta):
	pass
	
func add_score(score):
	score_value.text = str(int(score_value.text) + score)
