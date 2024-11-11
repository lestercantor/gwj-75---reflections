extends CharacterBody3D
class_name Player

@export var SPEED: float = 5.0
@export var ACCELERATION: float = 4.0


func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("left", "right", "down", "up")
	var direction := (transform.basis * Vector3(input_dir.x, input_dir.y, 0)).normalized()
	
	if input_dir.length() > 0:
		velocity = velocity.move_toward(direction * SPEED, delta * ACCELERATION)
	else:
		velocity = velocity.move_toward(Vector3.ZERO, delta * ACCELERATION)
	
	move_and_slide()
