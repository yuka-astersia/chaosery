extends CharacterBody2D

signal die

@export var movement_speed: int = 1500
@onready var target: Node2D = $"../../Player"
@export var hp: int = 20

func _physics_process(_delta):	
	if hp <= 0:
		die.emit()
		
	
	var target_position = (target.position - position).normalized()
	
	velocity = Vector2(target_position * movement_speed)
	
	look_at(target.position)
	move_and_slide()
