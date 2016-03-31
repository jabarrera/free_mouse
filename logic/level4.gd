extends Node2D


const START_X_POS = 592
const START_Y_POS = 112

const level = 4

const song = preload("res://resource/music/playing.ogg")
const song_death = preload ("res://resource/music/death.ogg")

func _ready():
	pass

func get_start_point():
	return Vector2(START_X_POS, START_Y_POS)
