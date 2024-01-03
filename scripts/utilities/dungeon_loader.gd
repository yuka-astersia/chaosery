extends Node2D

@onready var dungeon_container: Node2D = $DungeonContainer
@onready var player: CharacterBody2D = $"../Player"

var dungeon_instance: Node2D
var dungeons: Array = [
	"res://scenes/dungeons/dungeon_1.tscn",
	"res://scenes/dungeons/dungeon_2.tscn"
]

func get_dungeon():
	var dungeon_resource = load(dungeons[randi() % dungeons.size()])
	var dungeon_instance = dungeon_resource.instantiate()
	return dungeon_instance

func _ready():
	dungeon_instance = get_dungeon()
	dungeon_container.add_child(dungeon_instance)
	
	player.position = dungeon_instance.get_spawn_point()
