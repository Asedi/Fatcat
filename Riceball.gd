extends KinematicBody2D

onready var anim=get_node("Riceballall/riceballanim")
onready var riceballall=get_node("Riceballall")
var ruch=Vector2()
var toggle=true
var collision

func _physics_process(delta):
	self.position.y=870
	ruch.y=0
	collision=move_and_collide(ruch*delta)
	kolizja()
	if toggle:
		riceballall.scale.x=-1
		ruch.x=100
		anim.play("walk")
	else:
		riceballall.scale.x=1
		ruch.x=-100
		anim.play("walk")
	move_and_slide(ruch)
	self.position.y=870
func kolizja():
	if collision:
		if toggle:
			toggle = false
		else:
			toggle = true