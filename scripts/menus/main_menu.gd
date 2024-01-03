extends Node2D

@export var game_menu_scene_name: String = "menus/game_menu"
@export var leaderboard_menu_scene_name: String = "menus/leaderboard_menu"

signal start_new_game
signal open_leaderboard_menu

func _process(delta):
	pass

func _on_new_game_button_pressed():
	start_new_game.emit(game_menu_scene_name)

func _on_leaderboard_button_pressed():
	open_leaderboard_menu.emit(leaderboard_menu_scene_name)
