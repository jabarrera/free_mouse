extends Node2D


const START_X_POS = 115
const START_Y_POS = 228

const level = 1

const song = preload("res://resource/music/playing.ogg")
const song_death = preload ("res://resource/music/death.ogg")

func _ready():
	pass

func get_start_point():
	return Vector2(START_X_POS, START_Y_POS)
