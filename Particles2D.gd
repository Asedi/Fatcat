extends Particles2D

onready var test=get_node("../")
func _physics_process(delta):
	if test.ruch.x<600&&test.ruch.x>-600:
		emitting=false
	else:
		emitting=true