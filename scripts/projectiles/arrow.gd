extends Node2D

var travel_direction: Vector2 = Vector2.UP
var travel_speed: float = 1000
var travel_length: float = 0
var max_travel_length: float = 7000

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	travel_length += travel_speed * delta * 10
	position += travel_direction * travel_speed * delta
	
	if travel_length > max_travel_length:
		queue_free()
