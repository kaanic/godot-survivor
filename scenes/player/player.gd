extends CharacterBody2D

@export var MAX_SPEED: float = 200

func _process(delta: float) -> void:
	var movement_vector: Vector2 = get_movement_factor()
	var direction = movement_vector.normalized()
	
	velocity = direction * MAX_SPEED
	
	move_and_slide()
	

func get_movement_factor():
	var movement_vector: Vector2 = Vector2.ZERO
	
	var x_movement: float = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var y_movement: float = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	return Vector2(x_movement, y_movement)
	
