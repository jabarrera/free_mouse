
extends Node2D

var lives = []
const live_texture = preload("res://resource/graphics/raton.png")
const death_texture = preload("res://resource/graphics/raton_death.png")

func _ready():
	lives.push_back([get_node("una"), true])
	lives.push_back([get_node("dos"), true])
	lives.push_back([get_node("tres"), true])
	
	lives_init(GLOBALS.MAX_NUM_LIVES - GLOBALS.num_lives)


func lives_init(num_deaths):
	while (num_deaths > 0):
		death_count()
		num_deaths = num_deaths - 1

func lives_full():
	for live in lives:
		live[0].set_texture(live_texture)
		live[1] = true

func death_count():
	for live in lives:
		if live[1]:
			live[0].set_texture(death_texture)
			live[1] = false
			break