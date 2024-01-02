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
		
		var score_file_instance = FileAccess.open(save_file_path, FileAccess.READ)
		var score_file_data = score_file_instance.get_as_text()
		var score_file_data_as_json = JSON.parse_string(score_file_data)
		
		var score_index = 0
		for score_json_data in score_file_data_as_json:
			score_data[score_index] = score_json_data
			score_index += 1
	
	return score_data
	
func save_score(score_value, score_name):
	var result = []
	var highscores = load_score()
	
	dict(sorted(highscores.items(), key=lambda item: item[1]))
	
	print(highscores)
	
	
	print(result)
