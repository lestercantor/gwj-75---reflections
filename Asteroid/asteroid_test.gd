extends RigidBody3D

var speed: float = 5
var direction: Vector3 = Vector3.BACK

func _ready() -> void:
	set_linear_velocity(speed * direction)
