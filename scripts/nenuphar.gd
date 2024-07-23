extends Area3D


func _ready():
	connect("body_entered", win)


func win(body):
	if body is MovementController:
		get_node("AudioStreamPlayer3D").play()
		get_owner().get_node("WinLayer").show()
		get_tree().paused = true
