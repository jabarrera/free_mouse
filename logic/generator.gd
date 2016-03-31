
extends Node2D


var sound_id = -1
var generator_active

export var time_to_on = 2
export var time_to_off = 3

func _ready():
	set_on_time(time_to_on)
	set_off_time(time_to_off)
	_on_timer_off_timeout()
	set_process(true)

func _process(delta):
	#GodotEngine bug with looped samples. It thinks the sound channel is free and play a new sound up.
	if (sound_id != -1 and generator_active and !SOUND.get_sfx_player().is_voice_active(sound_id)):
		sound_id = SOUND.get_sfx_player().play("electricity")

func _exit_tree():
	SOUND.get_sfx_player().stop(sound_id)

func _on_timer_on_timeout():
	generator_active = true
	get_node("electricity").show()
	get_node("electricity").set_monitorable(true)
	get_node("AnimationPlayer").play("electricity")
	sound_id = SOUND.get_sfx_player().play("electricity")
	get_node("timer_off").start()

func _on_timer_off_timeout():
	generator_active = false
	get_node("electricity").hide()
	get_node("electricity").set_monitorable(false)
	get_node("AnimationPlayer").stop()
	if (sound_id != -1):
		SOUND.get_sfx_player().stop(sound_id)
	get_node("timer_on").start()
	
	
func set_on_time(sec):
	get_node("timer_on").set_wait_time(sec)
	

func set_off_time(sec):
	get_node("timer_off").set_wait_time(sec)
