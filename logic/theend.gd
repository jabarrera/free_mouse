
extends Node2D

const menu_be_continued_on = preload("res://resource/graphics/be_continued_on.png")
const menu_be_continued_off = preload("res://resource/graphics/be_continued_off.png")

const music_theend = preload("res://resource/music/menu.ogg")

func _ready():
	get_node("be-continued").set_pickable(false)
	get_node("AnimationPlayer").play("show_end")
	SOUND.get_music_player().set_stream(music_theend)
	SOUND.get_music_player().play()
	yield(get_node("AnimationPlayer"), "finished")
	get_node("be-continued").set_pickable(true)


func _on_becontinued_mouse_enter():
	SOUND.get_sfx_player().play("wink")
	get_node("be-continued/Sprite").set_texture(menu_be_continued_on)

func _on_becontinued_mouse_exit():
	get_node("be-continued/Sprite").set_texture(menu_be_continued_off)


func _on_becontinued_input_event( viewport, event, shape_idx ):
	if (event.type == InputEvent.MOUSE_BUTTON and event.button_index == BUTTON_LEFT and event.is_pressed()):
		get_tree().change_scene("res://logic/credits.tscn")
