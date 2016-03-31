
extends Area2D

const MSEC_DEATH_DELAY = 1000
var playing = false
var win = false
var death_point
var sfx_player
var music_player
var retry
var messages
var time_to_start = -1
var time_to_finish = -1


func _ready():
	retry = false
	set_fixed_process(true)
	sfx_player = SOUND.get_sfx_player()
	music_player = SOUND.get_music_player()
	play_music(get_parent().song)
	show_indicator()
	

func _fixed_process(delta):
	if (playing):
		update_position(get_viewport().get_mouse_pos())
	
func _on_area_enter( area ):
	if (playing):
		if (area.get_name() == "finish"):
			win()
		elif (area.get_name() == "level" or area.get_name() == "gear" or area.get_name() == "electricity" or area.get_name() == "mill"):
			death_point = get_node(".").get_pos()
			death()

func update_position(mouse_pos):
	set_pos(mouse_pos)

func playing():
	hide_indicator()
	SOUND.get_sfx_player().play("mouse")
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	get_viewport().warp_mouse(get_pos())
	playing = true
	time_to_start = OS.get_ticks_msec()
	
func not_playing():
	playing = false
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
func death():
	GLOBALS.num_lives = GLOBALS.num_lives - 1
	get_parent().get_node("lives").death_count()
	sfx_player.play("fail")
	
	if (GLOBALS.num_lives > 0):
		OS.delay_msec(MSEC_DEATH_DELAY)
		set_pos(get_parent().get_start_point())
		get_viewport().warp_mouse(get_pos())
		#restart the timer
		time_to_start = OS.get_ticks_msec()
	else:
		not_playing()
		show_message(false)
		play_music(get_parent().song_death)

func play_music(music):
	music_player.set_stream(music)
	music_player.set_loop(true)
	music_player.set_volume(1)
	music_player.play()


func win():
	time_to_finish = OS.get_ticks_msec()
	win = true
	not_playing()
	show_message(true)
	SOUND.get_music_player().stop()
	var victory_sound = SOUND.get_sfx_player().play("win")
	
	#Save the game
	var game_time = time_to_finish - time_to_start
	if (GLOBALS.levels[get_parent().level]["time"] == -1 or GLOBALS.levels[get_parent().level]["time"] > game_time):
		#waits to finish the animation. I'd like that sounds player have an emit signal of finished. :\
		yield(get_parent().get_node("messages").get_node("AnimationPlayer"), "finished")
		
		var record_scene = load("res://logic/record.tscn")
		var record_scene_instance = record_scene.instance()
		record_scene_instance.init(GLOBALS.convert_time(game_time))
		get_parent().add_child(record_scene_instance)
		GLOBALS.levels[get_parent().level]["time"] = game_time
		SAVEGAME.savegame()

func _on_mouse_input_event( viewport, event, shape_idx ):
	if (!playing and !win and event.type == InputEvent.MOUSE_BUTTON and event.button_index == BUTTON_LEFT and event.is_pressed()):
		playing()
		

func show_message(win):
	if (!retry):
		var message_scene = preload("res://logic/messages.tscn")
		messages = message_scene.instance()
		get_parent().add_child(messages)
	messages.show_message(win)
	
	
func retry_level():
	play_music(get_parent().song)
	show_indicator()
	retry = true
	messages.reset()
	GLOBALS.num_lives = GLOBALS.MAX_NUM_LIVES
	get_parent().get_node("lives").lives_full()
	set_pos(get_parent().get_start_point())
	
func show_indicator():
	get_node("aura").show()
	get_node("text_click").show()
	get_node("AnimationPlayer").play("text")
	
func hide_indicator():
	get_node("aura").hide()
	get_node("text_click").hide()
	get_node("AnimationPlayer").stop()
	
func show_death(show):
	if (show):
		get_node("death").show()
		get_node("death").update()
	else:
		get_node("death").hide()
	