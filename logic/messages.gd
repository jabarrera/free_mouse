
extends Node2D

const win_message = preload("res://resource/graphics/welldone.png")
const lose_message = preload("res://resource/graphics/failed.png")
const win_logo = preload("res://resource/graphics/happymouse.png")
const lose_logo = preload("res://resource/graphics/deathmouse.png")

const menu_on = preload("res://resource/graphics/menu_menu_on.png")
const menu_off = preload("res://resource/graphics/menu_menu_off.png")
const next_on = preload("res://resource/graphics/menu_next_on.png")
const next_off = preload("res://resource/graphics/menu_next_off.png")
const retry_on = preload("res://resource/graphics/menu_retry_on.png")
const retry_off = preload("res://resource/graphics/menu_retry_off.png")

var options_win
var show_final_scene = false


func _ready():
	#If is the level 10 we want to show the final scene.
	if (get_parent().level == 10):
		show_final_scene = true


func reset():
	hide()
	get_node("AnimationPlayer").seek(0, true)
	
func show_message(win):
	show()
	options_win = win
	if (win):
		if (show_final_scene):
			get_node("menu").hide()
		get_node("message").set_texture(win_message)
		get_node("logo").set_texture(win_logo)
		get_node("next/Sprite").set_texture(next_off)
	else:
		get_node("message").set_texture(lose_message)
		get_node("logo").set_texture(lose_logo)
		get_node("next/Sprite").set_texture(retry_off)
		
	get_node("AnimationPlayer").play("show")

func _on_menu_mouse_enter():
	get_node("menu/Sprite").set_texture(menu_on)
	SOUND.get_sfx_player().play("wink")


func _on_menu_mouse_exit():
	get_node("menu/Sprite").set_texture(menu_off)


func _on_next_mouse_enter():
	if (options_win):
		get_node("next/Sprite").set_texture(next_on)
	else:
		get_node("next/Sprite").set_texture(retry_on)
	SOUND.get_sfx_player().play("wink")


func _on_next_mouse_exit():
	if (options_win):
		get_node("next/Sprite").set_texture(next_off)
	else:
		get_node("next/Sprite").set_texture(retry_off)


func _on_menu_input_event( viewport, event, shape_idx ):
	if (event.type == InputEvent.MOUSE_BUTTON and event.button_index == BUTTON_LEFT and event.is_pressed()):
		get_tree().change_scene("res://logic/main_screen.tscn")


func _on_next_input_event( viewport, event, shape_idx ):
	if (event.type == InputEvent.MOUSE_BUTTON and event.button_index == BUTTON_LEFT and event.is_pressed()):
		if (options_win):
			#we are in the last level... ¡finish the game!
			if (show_final_scene):
				get_tree().change_scene("res://logic/theend.tscn")
				
			#we want to pass level
			get_tree().change_scene("res://logic/level" + str(get_parent().level + 1) + ".tscn")
		else:
			#we want to retry
			get_parent().get_node("mouse").retry_level()
