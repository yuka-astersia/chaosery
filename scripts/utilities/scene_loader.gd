extends Node2D

@onready var scene_container: Node2D = $SceneContainer

var signal_manager: Node2D;
var scene_instance: Node2D

func unload_scene():
	if (is_instance_valid(scene_instance)):
		scene_instance.queue_free()
	scene_instance = null

func load_scene(scene_name: String):
	var scene_resource: PackedScene = load("res://scenes/" + scene_name + ".tscn")
	
	if(scene_resource):
		unload_scene()
		scene_instance = scene_resource.instantiate()
		scene_container.add_child(scene_instance)
		signal_manager.connect_scene_signals(scene_name, scene_instance)
