extends Node2D

@export var save_file_path: String = "res://data/scores.json"
@onready var default_score_data: Array[Dictionary] = [
	{
		"name": "No Score Written Yet...",
		"score": 0
	},
	{
		"name": "No Score Written Yet...",
		"score": 0
	},
	{
		"name": "No Score Written Yet...",
		"score": 0
	},
	{
		"name": "No Score Written Yet...",
		"score": 0
	},
	{
		"name": "No Score Written Yet...",
		"score": 0
	},
]

func load_score():
	
	var score_data = default_score_data
	
	if FileAccess.file_exists(save_file_path):
		pass
	
	return score_data
