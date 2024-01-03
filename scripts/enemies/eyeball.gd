extends CharacterBody2D

signal die

@export var movement_speed: int = 150
@onready var target: Node2D
@export var hp: int = 20
@export var score_gained: int = 10

var game_menu: Node2D
var crash_damage: int = 25

func _physics_process(_delta):	
	if hp <= 0:
		game_menu.add_score(score_gained)
		queue_free()
		
	
	var target_position = (target.position - position).normalized()
	
	velocity = Vector2(target_position * movement_speed)
	
	look_at(target.position)
	move_and_slide()


func _on_detecion_area_body_entered(body):
	if body.name == "Player":
		body.damaged(crash_damage)
