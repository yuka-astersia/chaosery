extends Node2D

@onready var rng = RandomNumberGenerator.new()
@onready var dungeon_container: Node2D = $Dungeon


# Called when the node enters the scene tree for the first time.
func _ready():
	
	var dungeon_id = rng.randi_range(1, 2)
	var dungeon_resource = load("res://scenes/dungeons/dungeon_" + str(dungeon_id) + ".tscn")
	var dungeon_scene = dungeon_resource.instantiate()
	dungeon_scene.scale = Vector2(2.5, 2.5)
	
	dungeon_container.add_child(dungeon_scene)
	
	$Player.position = dungeon_container.get_child(0).get_player_spawn_point()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
