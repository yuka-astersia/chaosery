extends Node2D

@export var game_menu_scene_name: String = "menus/game_menu"
@export var leaderboard_menu_scene_name: String = "menus/leaderboard_menu"

@onready var menu_wallpaper: Sprite2D = $MenuWallpaper

signal start_new_game
signal open_leaderboard_menu

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	menu_wallpaper.position += (get_global_mouse_position() * delta) - menu_wallpaper.position

func _on_new_game_button_pressed():
	start_new_game.emit(game_menu_scene_name)

func _on_leaderboard_button_pressed():
	open_leaderboard_menu.emit(leaderboard_menu_scene_name)
