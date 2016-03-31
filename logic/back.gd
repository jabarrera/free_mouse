
extends Area2D

const menu_arrow_on = preload("res://resource/graphics/menu_arrow_on.png")
const menu_arrow_off = preload("res://resource/graphics/menu_arrow_off.png")


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func _on_back_mouse_enter():
	get_node("Sprite").set_texture(menu_arrow_on)
	SOUND.get_sfx_player().play("wink")


func _on_back_mouse_exit():
	get_node("Sprite").set_texture(menu_arrow_off)


func _on_back_input_event( viewport, event, shape_idx ):
	if (event.type == InputEvent.MOUSE_BUTTON and event.button_index == BUTTON_LEFT and event.is_pressed()):
		get_tree().change_scene("res://logic/main_screen.tscn")