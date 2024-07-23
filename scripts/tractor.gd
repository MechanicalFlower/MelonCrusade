extends RigidBody3D

@export var dir = 1
@export var speed = 25
var map_limit = 40


func _ready():
	look_at(global_transform.origin - Vector3.RIGHT * dir, Vector3.UP)


func _integrate_forces(_state: PhysicsDirectBodyState3D):
	if dir == 1 and global_transform.origin.x >= map_limit:
		global_transform.origin.x = -map_limit
	if dir == -1 and global_transform.origin.x <= -map_limit:
		global_transform.origin.x = map_limit

	linear_velocity = Vector3.RIGHT * dir * speed


func _on_body_entered(body):
	if body is MovementController:
		get_node("Horn").play()
		get_owner().get_node("DeadLayer").show()
		get_tree().paused = true
