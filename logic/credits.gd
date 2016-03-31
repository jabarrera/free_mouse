
extends Node2D

const music_credits = preload("res://resource/music/menu.ogg")

func _ready():
	SOUND.get_music_player().set_stream(music_credits)
	SOUND.get_music_player().play()


