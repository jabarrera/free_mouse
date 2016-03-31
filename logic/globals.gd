extends Node

var levels

const MAX_NUM_LIVES = 3
var num_lives

func _ready():
	num_lives = MAX_NUM_LIVES
	
#convert a msec time to a human eyes time
func convert_time(time):
	var cent = time % 1000
	var sec = floor((time/1000) % 60)
	var minutes = floor(sec/60)
	
	return str(minutes).pad_zeros(2) + ":" + str(sec).pad_zeros(2) + ":" + str(cent).pad_zeros(3)