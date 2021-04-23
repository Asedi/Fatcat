extends KinematicBody2D

onready var sprite=get_node('animsprite')
var dol=-20
var ruch=Vector2()
var xd="xd"
var odbicie=0.9
var predkosc=200
var predkosc_skoku=-200
var motion
var skakanie=false
var grawitacja=420
var randomnumber=0

func get_input():
	var prawo = Input.is_action_pressed('ui_right')
	var zagrajanim = Input.is_action_pressed('ui_l')
	var lewo = Input.is_action_pressed('ui_left')
	var dol = Input.is_action_pressed('ui_down')
	var skok = Input.is_action_pressed('ui_up')
	randomnumber=randi()%231+1
	if skok and is_on_floor():
		skakanie = true
		ruch.y = predkosc_skoku
	if prawo:
		ruch.x=predkosc
	elif lewo:
		ruch.x=-predkosc
	else:
		ruch.x=0
	if randomnumber==7:
		sprite.play("blink")
	if sprite.frame==3:
		sprite.stop()
		sprite.frame=0
	pass




func _physics_process(delta):
	var collision=move_and_collide(ruch*delta)
	if collision:
		ruch=ruch.bounce(collision.normal)*odbicie
	get_input()
	ruch.y+=delta*grawitacja
	if skakanie and is_on_floor():
		skakanie = false
	ruch = move_and_slide(ruch, Vector2(0, -1))
