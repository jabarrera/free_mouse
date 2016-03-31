
extends Node2D

const level1_off = preload("res://resource/graphics/level1_mini_off.png")
const level1_on = preload("res://resource/graphics/level1_mini_on.png")
const level2_off = preload("res://resource/graphics/level2_mini_off.png")
const level2_on = preload("res://resource/graphics/level2_mini_on.png")
const level3_off = preload("res://resource/graphics/level3_mini_off.png")
const level3_on = preload("res://resource/graphics/level3_mini_on.png")
const level4_off = preload("res://resource/graphics/level4_mini_off.png")
const level4_on = preload("res://resource/graphics/level4_mini_on.png")
const level5_off = preload("res://resource/graphics/level5_mini_off.png")
const level5_on = preload("res://resource/graphics/level5_mini_on.png")
const level6_off = preload("res://resource/graphics/level6_mini_off.png")
const level6_on = preload("res://resource/graphics/level6_mini_on.png")
const level7_off = preload("res://resource/graphics/level7_mini_off.png")
const level7_on = preload("res://resource/graphics/level7_mini_on.png")
const level8_off = preload("res://resource/graphics/level8_mini_off.png")
const level8_on = preload("res://resource/graphics/level8_mini_on.png")
const level9_off = preload("res://resource/graphics/level9_mini_off.png")
const level9_on = preload("res://resource/graphics/level9_mini_on.png")
const level10_off = preload("res://resource/graphics/level10_mini_off.png")
const level10_on = preload("res://resource/graphics/level10_mini_on.png")

const menu_arrow_off = preload("res://resource/graphics/menu_arrow_off.png")
const menu_arrow_on = preload("res://resource/graphics/menu_arrow_on.png")


func _ready():
	get_node("prevs_levels").hide()
	
	if (GLOBALS.levels[1]["time"] != -1):
		get_node("levels1_9/level1/padlock").hide()
		get_node("levels1_9/level1/info/time").set_text(check_best_time(GLOBALS.levels[1]["time"]))
	else:
		get_node("levels1_9/level1").set_pickable(false)
		
	
	if (GLOBALS.levels[2]["time"] != -1 or GLOBALS.levels[1]["time"] != -1):
		get_node("levels1_9/level2/padlock").hide()
		get_node("levels1_9/level2/info/time").set_text(check_best_time(GLOBALS.levels[2]["time"]))
	else:
		get_node("levels1_9/level2").set_pickable(false)
		
	if (GLOBALS.levels[3]["time"] != -1 or GLOBALS.levels[2]["time"] != -1):
		get_node("levels1_9/level3/padlock").hide()
		get_node("levels1_9/level3/info/time").set_text(check_best_time(GLOBALS.levels[3]["time"]))
	else:
		get_node("levels1_9/level3").set_pickable(false)
	
	if (GLOBALS.levels[4]["time"] != -1 or GLOBALS.levels[3]["time"] != -1):
		get_node("levels1_9/level4/padlock").hide()
		get_node("levels1_9/level4/info/time").set_text(check_best_time(GLOBALS.levels[4]["time"]))
	else:
		get_node("levels1_9/level4").set_pickable(false)
	
	if (GLOBALS.levels[5]["time"] != -1 or GLOBALS.levels[4]["time"] != -1):
		get_node("levels1_9/level5/padlock").hide()
		get_node("levels1_9/level5/info/time").set_text(check_best_time(GLOBALS.levels[5]["time"]))
	else:
		get_node("levels1_9/level5").set_pickable(false)
	
	
	if (GLOBALS.levels[6]["time"] != -1 or GLOBALS.levels[5]["time"] != -1):
		get_node("levels1_9/level6/padlock").hide()
		get_node("levels1_9/level6/info/time").set_text(check_best_time(GLOBALS.levels[6]["time"]))
	else:
		get_node("levels1_9/level6").set_pickable(false)
	
	
	if (GLOBALS.levels[7]["time"] != -1 or GLOBALS.levels[6]["time"] != -1):
		get_node("levels1_9/level7/padlock").hide()
		get_node("levels1_9/level7/info/time").set_text(check_best_time(GLOBALS.levels[7]["time"]))
	else:
		get_node("levels1_9/level7").set_pickable(false)
	
	if (GLOBALS.levels[8]["time"] != -1 or GLOBALS.levels[7]["time"] != -1):
		get_node("levels1_9/level8/padlock").hide()
		get_node("levels1_9/level8/info/time").set_text(check_best_time(GLOBALS.levels[8]["time"]))
	else:
		get_node("levels1_9/level8").set_pickable(false)
	
	if (GLOBALS.levels[9]["time"] != -1 or GLOBALS.levels[8]["time"] != -1):
		get_node("levels1_9/level9/padlock").hide()
		get_node("levels1_9/level9/info/time").set_text(check_best_time(GLOBALS.levels[9]["time"]))
	else:
		get_node("levels1_9/level9").set_pickable(false)

	if (GLOBALS.levels[10]["time"] != -1 or GLOBALS.levels[9]["time"] != -1):
		get_node("level10/padlock").hide()
		get_node("level10/info/time").set_text(check_best_time(GLOBALS.levels[10]["time"]))
	else:
		get_node("level10").set_pickable(false)
		
func _on_level1_mouse_enter():
	if (GLOBALS.levels[1]["time"] != -1):
		SOUND.get_sfx_player().play("wink")
		get_node("levels1_9/level1/level").set_texture(level1_on)
		get_node("levels1_9/level1/info").show()

func _on_level1_mouse_exit():
	if (GLOBALS.levels[1]["time"] != -1):
		get_node("levels1_9/level1/level").set_texture(level1_off)
		get_node("levels1_9/level1/info").hide()


func _on_level1_input_event( viewport, event, shape_idx ):
	if (event.type == InputEvent.MOUSE_BUTTON and event.button_index == BUTTON_LEFT and event.is_pressed()):
		get_tree().change_scene("res://logic/level1.tscn")


func _on_level2_mouse_enter():
	if (GLOBALS.levels[2]["time"] != -1 or GLOBALS.levels[1]["time"] != -1):
		SOUND.get_sfx_player().play("wink")
		get_node("levels1_9/level2/level").set_texture(level2_on)
		get_node("levels1_9/level2/info").show()


func _on_level2_mouse_exit():
	if (GLOBALS.levels[2]["time"] != -1 or GLOBALS.levels[1]["time"] != -1):
		get_node("levels1_9/level2/level").set_texture(level2_off)
		get_node("levels1_9/level2/info").hide()
		


func _on_level2_input_event( viewport, event, shape_idx ):
	if (event.type == InputEvent.MOUSE_BUTTON and event.button_index == BUTTON_LEFT and event.is_pressed()):
		get_tree().change_scene("res://logic/level2.tscn")



func _on_level3_mouse_enter():
	if (GLOBALS.levels[3]["time"] != -1 or GLOBALS.levels[2]["time"] != -1):
		SOUND.get_sfx_player().play("wink")
		get_node("levels1_9/level3/level").set_texture(level3_on)
		get_node("levels1_9/level3/info").show()


func _on_level3_mouse_exit():
	if (GLOBALS.levels[3]["time"] != -1 or GLOBALS.levels[2]["time"] != -1):
		get_node("levels1_9/level3/level").set_texture(level3_off)
		get_node("levels1_9/level3/info").hide()


func _on_level3_input_event( viewport, event, shape_idx ):
	if (event.type == InputEvent.MOUSE_BUTTON and event.button_index == BUTTON_LEFT and event.is_pressed()):
		get_tree().change_scene("res://logic/level3.tscn")
		
		

func _on_level4_mouse_enter():
	if (GLOBALS.levels[4]["time"] != -1 or GLOBALS.levels[3]["time"] != -1):
		SOUND.get_sfx_player().play("wink")
		get_node("levels1_9/level4/level").set_texture(level4_on)
		get_node("levels1_9/level4/info").show()



func _on_level4_mouse_exit():
	if (GLOBALS.levels[4]["time"] != -1 or GLOBALS.levels[3]["time"] != -1):
		get_node("levels1_9/level4/level").set_texture(level4_off)
		get_node("levels1_9/level4/info").hide()

func _on_level4_input_event( viewport, event, shape_idx ):
	if (event.type == InputEvent.MOUSE_BUTTON and event.button_index == BUTTON_LEFT and event.is_pressed()):
		get_tree().change_scene("res://logic/level4.tscn")


func _on_level5_mouse_enter():
	if (GLOBALS.levels[5]["time"] != -1 or GLOBALS.levels[4]["time"] != -1):
		SOUND.get_sfx_player().play("wink")
		get_node("levels1_9/level5/level").set_texture(level5_on)
		get_node("levels1_9/level5/info").show()

func _on_level5_mouse_exit():
	if (GLOBALS.levels[5]["time"] != -1 or GLOBALS.levels[4]["time"] != -1):
		get_node("levels1_9/level5/level").set_texture(level5_off)
		get_node("levels1_9/level5/info").hide()

func _on_level5_input_event( viewport, event, shape_idx ):
	if (event.type == InputEvent.MOUSE_BUTTON and event.button_index == BUTTON_LEFT and event.is_pressed()):
		get_tree().change_scene("res://logic/level5.tscn")


func _on_level6_mouse_enter():
	if (GLOBALS.levels[6]["time"] != -1 or GLOBALS.levels[5]["time"] != -1):
		SOUND.get_sfx_player().play("wink")
		get_node("levels1_9/level6/level").set_texture(level6_on)
		get_node("levels1_9/level6/info").show()

func _on_level6_mouse_exit():
	if (GLOBALS.levels[6]["time"] != -1 or GLOBALS.levels[5]["time"] != -1):
		get_node("levels1_9/level6/level").set_texture(level6_off)
		get_node("levels1_9/level6/info").hide()

func _on_level6_input_event( viewport, event, shape_idx ):
	if (event.type == InputEvent.MOUSE_BUTTON and event.button_index == BUTTON_LEFT and event.is_pressed()):
		get_tree().change_scene("res://logic/level6.tscn")


func _on_level7_mouse_enter():
	if (GLOBALS.levels[7]["time"] != -1 or GLOBALS.levels[6]["time"] != -1):
		SOUND.get_sfx_player().play("wink")
		get_node("levels1_9/level7/level").set_texture(level7_on)
		get_node("levels1_9/level7/info").show()

func _on_level7_mouse_exit():
	if (GLOBALS.levels[7]["time"] != -1 or GLOBALS.levels[6]["time"] != -1):
		get_node("levels1_9/level7/level").set_texture(level7_off)
		get_node("levels1_9/level7/info").hide()

func _on_level7_input_event( viewport, event, shape_idx ):
	if (event.type == InputEvent.MOUSE_BUTTON and event.button_index == BUTTON_LEFT and event.is_pressed()):
		get_tree().change_scene("res://logic/level7.tscn")


func _on_level8_mouse_enter():
	if (GLOBALS.levels[8]["time"] != -1 or GLOBALS.levels[7]["time"] != -1):
		SOUND.get_sfx_player().play("wink")
		get_node("levels1_9/level8/level").set_texture(level8_on)
		get_node("levels1_9/level8/info").show()

func _on_level8_mouse_exit():
	if (GLOBALS.levels[8]["time"] != -1 or GLOBALS.levels[7]["time"] != -1):
		get_node("levels1_9/level8/level").set_texture(level8_off)
		get_node("levels1_9/level8/info").hide()

func _on_level8_input_event( viewport, event, shape_idx ):
	if (event.type == InputEvent.MOUSE_BUTTON and event.button_index == BUTTON_LEFT and event.is_pressed()):
		get_tree().change_scene("res://logic/level8.tscn")


func _on_level9_mouse_enter():
	if (GLOBALS.levels[9]["time"] != -1 or GLOBALS.levels[8]["time"] != -1):
		SOUND.get_sfx_player().play("wink")
		get_node("levels1_9/level9/level").set_texture(level9_on)
		get_node("levels1_9/level9/info").show()

func _on_level9_mouse_exit():
	if (GLOBALS.levels[9]["time"] != -1 or GLOBALS.levels[8]["time"] != -1):
		get_node("levels1_9/level9/level").set_texture(level9_off)
		get_node("levels1_9/level9/info").hide()

func _on_level9_input_event( viewport, event, shape_idx ):
	if (event.type == InputEvent.MOUSE_BUTTON and event.button_index == BUTTON_LEFT and event.is_pressed()):
		get_tree().change_scene("res://logic/level9.tscn")


func _on_level10_mouse_enter():
	if (GLOBALS.levels[10]["time"] != -1 or GLOBALS.levels[9]["time"] != -1):
		SOUND.get_sfx_player().play("wink")
		get_node("level10/level").set_texture(level10_on)
		get_node("level10/info").show()

func _on_level10_mouse_exit():
	if (GLOBALS.levels[10]["time"] != -1 or GLOBALS.levels[9]["time"] != -1):
		get_node("level10/level").set_texture(level10_off)
		get_node("level10/info").hide()

func _on_level10_input_event( viewport, event, shape_idx ):
	if (event.type == InputEvent.MOUSE_BUTTON and event.button_index == BUTTON_LEFT and event.is_pressed()):
		get_tree().change_scene("res://logic/level10.tscn")


func _on_next_levels_mouse_enter():
	SOUND.get_sfx_player().play("wink")
	get_node("next_levels/Sprite").set_texture(menu_arrow_on)

func _on_next_levels_mouse_exit():
	get_node("next_levels/Sprite").set_texture(menu_arrow_off)

func _on_next_levels_input_event( viewport, event, shape_idx ):
	if (event.type == InputEvent.MOUSE_BUTTON and event.button_index == BUTTON_LEFT and event.is_pressed()):
		get_node("AnimationPlayer").play("next_level")
		get_node("back").hide()
		get_node("prevs_levels").show()
		get_node("next_levels").hide()


func _on_prevs_levels_mouse_enter():
	SOUND.get_sfx_player().play("wink")
	get_node("prevs_levels/Sprite").set_texture(menu_arrow_on)


func _on_prevs_levels_mouse_exit():
	get_node("prevs_levels/Sprite").set_texture(menu_arrow_off)


func _on_prevs_levels_input_event( viewport, event, shape_idx ):
	if (event.type == InputEvent.MOUSE_BUTTON and event.button_index == BUTTON_LEFT and event.is_pressed()):
		get_node("AnimationPlayer").play("prev_levels")
		get_node("back").show()
		get_node("next_levels").show()
		get_node("prevs_levels").hide()

func check_best_time(time):
	if (time == -1):
		return "Not yet"
	else:
		return GLOBALS.convert_time(time)