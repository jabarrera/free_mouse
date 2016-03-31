
extends Node2D

const menu_play_off = preload("res://resource/graphics/menu_play_off.png")
const menu_play_on = preload("res://resource/graphics/menu_play_on.png")
const menu_quit_off = preload("res://resource/graphics/menu_quit_off.png")
const menu_quit_on = preload("res://resource/graphics/menu_quit_on.png")
const menu_levels_off = preload("res://resource/graphics/menu_levels_off.png")
const menu_levels_on = preload("res://resource/graphics/menu_levels_on.png")
const menu_credits_off = preload("res://resource/graphics/menu_credits_off.png")
const menu_credits_on = preload("res://resource/graphics/menu_credits_on.png")



const music = preload("res://resource/music/menu.ogg")


var level_actual


func _ready():
	level_actual = get_level()
	init_lives()
	if (SOUND.get_music_player() != null):
		SOUND.get_music_player().set_stream(music)
		SOUND.get_music_player().play()
	show_menu()
	

#get the last level passed
func get_level():
	var my_next_level = "level10"
	#get the last level played
	for level_i in range(GLOBALS.levels.size()-1):
		if (GLOBALS.levels[level_i + 1]["time"] == -1):
			my_next_level = "level" + str(level_i + 1)
			break
			
	return my_next_level

func _on_Play_mouse_enter():
	SOUND.get_sfx_player().play("wink")
	get_node("menu/Play/Sprite").set_texture(menu_play_on)

func _on_Play_mouse_exit():
	get_node("menu/Play/Sprite").set_texture(menu_play_off)


func _on_Quit_mouse_enter():
	SOUND.get_sfx_player().play("wink")
	get_node("menu/Quit/Sprite").set_texture(menu_quit_on)


func _on_Quit_mouse_exit():
	get_node("menu/Quit/Sprite").set_texture(menu_quit_off)


func _on_Play_input_event( viewport, event, shape_idx ):
	if (event.type == InputEvent.MOUSE_BUTTON and event.button_index == BUTTON_LEFT and event.is_pressed()):
		get_tree().change_scene("res://logic/" + level_actual + ".tscn")



func _on_Quit_input_event( viewport, event, shape_idx ):
	if (event.type == InputEvent.MOUSE_BUTTON and event.button_index == BUTTON_LEFT and event.is_pressed()):
		get_tree().quit()


func show_menu():
	get_node("AnimationPlayer").play("show_menu")
	
func init_lives():
	GLOBALS.num_lives = GLOBALS.MAX_NUM_LIVES

func _on_levels_mouse_enter():
	SOUND.get_sfx_player().play("wink")
	get_node("menu/levels/Sprite").set_texture(menu_levels_on)


func _on_levels_mouse_exit():
	get_node("menu/levels/Sprite").set_texture(menu_levels_off)


func _on_levels_input_event( viewport, event, shape_idx ):
	if (event.type == InputEvent.MOUSE_BUTTON and event.button_index == BUTTON_LEFT and event.is_pressed()):
		get_tree().change_scene("res://logic/levels.tscn")


func _on_credits_mouse_enter():
	SOUND.get_sfx_player().play("wink")
	get_node("menu/credits/Sprite").set_texture(menu_credits_on)


func _on_credits_mouse_exit():
	get_node("menu/credits/Sprite").set_texture(menu_credits_off)


func _on_credits_input_event( viewport, event, shape_idx ):
	if (event.type == InputEvent.MOUSE_BUTTON and event.button_index == BUTTON_LEFT and event.is_pressed()):
		get_tree().change_scene("res://logic/credits.tscn")
