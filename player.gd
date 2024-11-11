extends CharacterBody3D
class_name Player

@export var SPEED: float = 5.0
@export var ACCELERATION: float = 4.0

# Check if the player is in the mirror dimension
var should_invert: bool = false

var input_dir: Vector2

func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	input_dir = Input.get_vector("left", "right", "down", "up")
	var direction: Vector3 = (transform.basis * Vector3(input_dir.x, input_dir.y, 0)).normalized()
	
	# Swaps the player's controls
	if should_invert:
		direction = -direction
	
	# Moves the player depending on the input they are pressing, with acceleration
	if input_dir.length() > 0:
		velocity = velocity.move_toward(direction * SPEED, delta * ACCELERATION)
	else:
		velocity = velocity.move_toward(Vector3.ZERO, delta * ACCELERATION)
	
	move_and_slide()
