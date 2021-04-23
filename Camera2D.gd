extends Camera2D


func _process(delta):
	get_node('Label').set_text(str(Engine.get_frames_per_second()))
