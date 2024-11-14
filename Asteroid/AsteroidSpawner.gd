extends Node3D

@onready var top_left_marker: Marker3D = $TopLeftLimit
@onready var bottom_right_marker: Marker3D = $BottomRightLimit

var top_left_limit: Vector3
var bottom_right_limit: Vector3

@export var asteroid_scene: PackedScene

func _ready() -> void:
	top_left_limit = top_left_marker.global_position
	bottom_right_limit = bottom_right_marker.global_position


func _on_timer_timeout() -> void:
	var asteroid = asteroid_scene.instantiate()
	asteroid.position = rand_vector3()
	get_parent().add_child.call_deferred(asteroid)

func rand_vector3() -> Vector3:
	var upper_x = top_left_limit.x
	var upper_y = top_left_limit.y
	var upper_z = top_left_limit.z
	
	var lower_x = bottom_right_limit.x
	var lower_y = bottom_right_limit.y
	var lower_z = bottom_right_limit.z
	
	return Vector3(
	randf_range(lower_x, upper_x),
	randf_range(lower_y, upper_y),
	randf_range(lower_z, upper_z))
