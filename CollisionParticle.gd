extends Particles2D

onready var test=get_node("../")

func _physics_process(delta):
	if test.collision&&test.impact:
		emitting=true
	else:
		emitting=false