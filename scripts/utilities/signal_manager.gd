extends Node2D

signal change_scene(scene_name)

func connect_scene_signals(scene_name, scene_instance):
	if scene_name == "menus/main_menu":
		scene_instance.start_new_game.connect(trigger_change_scene)
		scene_instance.open_leaderboard_menu.connect(trigger_change_scene)
		
	if scene_name == "menus/leaderboard_menu":
		scene_instance.change_scene.connect(trigger_change_scene)

func trigger_change_scene(scene_name):
	change_scene.emit(scene_name)
