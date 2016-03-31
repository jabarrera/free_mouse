extends Node2D


const START_X_POS = 572
const START_Y_POS = 102

const level = 7

const song = preload("res://resource/music/playing.ogg")
const song_death = preload ("res://resource/music/death.ogg")

func _ready():
	pass

func get_start_point():
	return Vector2(START_X_POS, START_Y_POS)
