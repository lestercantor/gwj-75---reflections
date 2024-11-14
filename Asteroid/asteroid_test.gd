extends RigidBody3D

var speed: float = 5
@export var direction: Vector3 = Vector3.BACK

func _ready() -> void:
	speed = randi_range(5, 15)
	set_linear_velocity(speed * direction)

func _on_body_entered(body: Node) -> void:
	if not body is Player: return
	
	print("hit")
	await get_tree().create_timer(1).timeout
	# play explosion animation? 
	queue_free()
