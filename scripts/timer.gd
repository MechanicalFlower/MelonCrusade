extends Label

var time = 0


func _process(delta):
	set_text("Time: %02d:%02d" % [time / 60, fmod(time, 60)])
	time += delta
