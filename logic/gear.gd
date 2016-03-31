
extends Area2D

var angle
const DEFAULT_SPEED = 0.01
var speed
var sound_id

func _ready():
	set_process(true)
	speed = DEFAULT_SPEED
	angle = get_rot()
	sound_id = SOUND.get_sfx_player().play("gear")


func _process(delta):
	#GodotEngine bug with looped samples. It thinks the sound channel is free and play a new sound up.
	if (!SOUND.get_sfx_player().is_voice_active(sound_id)):
		sound_id = SOUND.get_sfx_player().play("gear")

func _exit_tree():
	SOUND.get_sfx_player().stop(sound_id)

func set_speed(new_speed):
	speed = new_speed

func _on_Timer_timeout():
	rotate(angle - speed)
