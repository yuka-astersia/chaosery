extends Node2D

func connect_scene_signal(scene_name, scene_instance):
	if scene_name == "menus/main_menu":
		scene_instance.new_game.connect(get_parent().new_game)
