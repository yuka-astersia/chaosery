extends Node2D

var scene_instance: Node2D
var scene_name: String

@export var default_scene: String = "menus/main_menu"

@onready var menu_container: Node2D = $MenuContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	load_scene(default_scene)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func load_scene(target):
	unload_scene()
	var scene_resource = load("res://scenes/" + target + ".tscn")
	
	if(scene_resource):
		scene_name = target
		scene_instance = scene_resource.instantiate()
		menu_container.add_child(scene_instance)
		$SignalManager.connect_scene_signal(scene_name, scene_instance)
	
func unload_scene(): 
	if (is_instance_valid(scene_instance)):
		scene_instance.queue_free()
	scene_instance = null

func new_game():
	load_scene("menus/game_menu")
