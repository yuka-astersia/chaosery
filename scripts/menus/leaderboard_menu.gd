extends Node2D

signal back_to_main_menu

@onready var score_manager: Node2D = $ScoreManager

@onready var rank1_name: Label = $LeaderboardControl/LeaderboardData/Rank1/NameLabel
@onready var rank2_name: Label = $LeaderboardControl/LeaderboardData/Rank2/NameLabel
@onready var rank3_name: Label = $LeaderboardControl/LeaderboardData/Rank3/NameLabel
@onready var rank4_name: Label = $LeaderboardControl/LeaderboardData/Rank4/NameLabel
@onready var rank5_name: Label = $LeaderboardControl/LeaderboardData/Rank5/NameLabel

@onready var rank1_score: Label = $LeaderboardControl/LeaderboardData/Rank1/ScoreLabel
@onready var rank2_score: Label = $LeaderboardControl/LeaderboardData/Rank2/ScoreLabel
@onready var rank3_score: Label = $LeaderboardControl/LeaderboardData/Rank3/ScoreLabel
@onready var rank4_score: Label = $LeaderboardControl/LeaderboardData/Rank4/ScoreLabel
@onready var rank5_score: Label = $LeaderboardControl/LeaderboardData/Rank5/ScoreLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	
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


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_back_to_main_menu_button_pressed():
	back_to_main_menu.emit()
