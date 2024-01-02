extends Node2D

signal new_game
signal open_leaderboard

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_new_game_button_pressed():
	new_game.emit()


func _on_leaderboard_button_pressed():
	open_leaderboard.emit()
