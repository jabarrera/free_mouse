
extends Node


func _ready():
	pass

func get_sfx_player():
	return get_node("SamplePlayer")
	
func get_music_player():
	return get_node("StreamPlayer")