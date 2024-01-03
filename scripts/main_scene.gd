extends Node2D

@onready var scene_loader: Node2D = $SceneLoader
@onready var signal_manager: Node2D = $SignalManager

@export var default_scene: String = "menus/game_menu"

func _ready():
	scene_loader.signal_manager = signal_manager
	scene_loader.load_scene(default_scene)

func _on_signal_manager_change_scene(scene_name):
	scene_loader.load_scene(scene_name)
