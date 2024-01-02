extends Node2D

func connect_scene_signal(scene_name, scene_instance):
	if scene_name == "menus/main_menu":
		scene_instance.new_game.connect(get_parent().new_game)
		scene_instance.open_leaderboard.connect(get_parent().open_leaderboard)

	if scene_name == "menus/leaderboard_menu":
		scene_instance.back_to_main_menu.connect(get_parent().open_main_menu)
