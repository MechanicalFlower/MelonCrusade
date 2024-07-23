extends Node3D

@onready var player = get_tree().get_nodes_in_group(&"player")[0]


func _ready() -> void:
	get_viewport().scaling_3d_scale = 0.5
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _process(_delta):
	if player.global_transform.origin.y < -1:
		player.get_node("AudioStreamPlayer3D").play()
		get_node("DeadLayer").show()
		get_tree().paused = true
		#get_tree().quit()


func _input(event: InputEvent) -> void:
	# if event.is_action_pressed(&"ui_cancel"):
	# 	get_tree().change_scene_to_file("res://scenes/menu.tscn")

	if event.is_action_pressed(&"change_mouse_input"):
		match Input.get_mouse_mode():
			Input.MOUSE_MODE_CAPTURED:
				Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			Input.MOUSE_MODE_VISIBLE:
				Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
