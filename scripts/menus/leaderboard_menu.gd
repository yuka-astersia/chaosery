extends Node2D

signal change_scene(scene_name)

@onready var score_manager: Node2D = $ScoreManager

# Just leave it here for now.... im gonna write the algo next time
@onready var rank1_name: Label = $LeaderboardCanvas/LeaderboardData/Rank1/NameLabel
@onready var rank2_name: Label = $LeaderboardCanvas/LeaderboardData/Rank2/NameLabel
@onready var rank3_name: Label = $LeaderboardCanvas/LeaderboardData/Rank3/NameLabel
@onready var rank4_name: Label = $LeaderboardCanvas/LeaderboardData/Rank4/NameLabel
@onready var rank5_name: Label = $LeaderboardCanvas/LeaderboardData/Rank5/NameLabel
@onready var rank1_score: Label = $LeaderboardCanvas/LeaderboardData/Rank1/ScoreLabel
@onready var rank2_score: Label = $LeaderboardCanvas/LeaderboardData/Rank2/ScoreLabel
@onready var rank3_score: Label = $LeaderboardCanvas/LeaderboardData/Rank3/ScoreLabel
@onready var rank4_score: Label = $LeaderboardCanvas/LeaderboardData/Rank4/ScoreLabel
@onready var rank5_score: Label = $LeaderboardCanvas/LeaderboardData/Rank5/ScoreLabel


func _ready():
	# don't mind this... im gonna write a new algo next time
	var score_data = score_manager.load_score()
	
	rank1_name.text = str(score_data[0]["name"])
	rank1_score.text = str(score_data[0]["score"])
	rank2_name.text = str(score_data[1]["name"])
	rank2_score.text = str(score_data[1]["score"])
	rank3_name.text = str(score_data[2]["name"])
	rank3_score.text = str(score_data[2]["score"])
	rank4_name.text = str(score_data[3]["name"])
	rank4_score.text = str(score_data[3]["score"])
	rank5_name.text = str(score_data[4]["name"])
	rank5_score.text = str(score_data[4]["score"])

func _on_back_button_pressed():
	change_scene.emit("menus/main_menu")
