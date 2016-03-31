
extends Area2D

var init_angle

export var time = 0.01

const DEFAULT_SPEED = 0.01

var speed = DEFAULT_SPEED

func _ready():
	set_time(time)
	init_angle = get_rot()
	
func _on_Timer_timeout():
	rotate(init_angle - DEFAULT_SPEED)

func set_time(sec):
	get_node("Timer").set_wait_time(sec)