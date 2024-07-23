extends Node


func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed:
			match event.keycode:
				KEY_R:
					get_tree().paused = false
					get_tree().change_scene_to_file("res://scenes/main.tscn")
				KEY_T:
					get_tree().quit()
