
extends Node2D

const zero = preload("res://resource/graphics/chars/0.png")
const one = preload("res://resource/graphics/chars/1.png")
const two = preload("res://resource/graphics/chars/2.png")
const three = preload("res://resource/graphics/chars/3.png")
const four = preload("res://resource/graphics/chars/4.png")
const five = preload("res://resource/graphics/chars/5.png")
const six = preload("res://resource/graphics/chars/6.png")
const seven = preload("res://resource/graphics/chars/7.png")
const eight = preload("res://resource/graphics/chars/8.png")
const nine = preload("res://resource/graphics/chars/9.png")

var numbers

func _init():
	hide()
	numbers = {"0":zero, "1":one, "2":two, "3":three, "4":four, "5":five, "6":six, "7":seven, "8":eight, "9":nine}
	

func init(time):
	get_node("minutes/minutes_1").set_texture(numbers[time[0]])
	get_node("minutes/minutes_2").set_texture(numbers[time[1]])
	get_node("seconds/seconds_1").set_texture(numbers[time[3]])
	get_node("seconds/seconds_2").set_texture(numbers[time[4]])
	get_node("mil/mil_1").set_texture(numbers[time[6]])
	get_node("mil/mil_2").set_texture(numbers[time[7]])
	get_node("mil/mil_3").set_texture(numbers[time[8]])
	show()
	SOUND.get_sfx_player().play("tada")