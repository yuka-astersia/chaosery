extends CharacterBody2D

@export var movement_speed: int = 150
@export var target: Node2D
@export var damage: int = 50
@export var hp: int = 20

@onready var score_value = get_parent().get_parent().get_parent().get_parent().get_child(2).get_child(3)

func _physics_process(delta):
	
	if hp <= 0:
		score_value.text = str(int(score_value.text) + 10)
		queue_free()
	
	var target_position = (target.position - position).normalized()
	
	velocity = Vector2(target_position * movement_speed)
	
	look_at(target.position)
	
	move_and_slide()


func _on_area_2d_body_entered(body):
	
	
	body.game_over()
