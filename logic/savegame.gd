
extends Node

# Savegame:
# level (int) - time (-1 not passed)

const PATH_SAVEGAME = "user://savegame.dat"

func _ready():
	var savegame_f = File.new()
	if (savegame_f.file_exists(PATH_SAVEGAME)):
		savegame_f.open(PATH_SAVEGAME, File.READ)
		GLOBALS.levels = savegame_f.get_var()
		savegame_f.close()
	else:
		#damnit! Godot Engine cannot add new item to a Dictionary	
		GLOBALS.levels = {
			1:{"time":-1},
			2:{"time":-1},
			3:{"time":-1},
			4:{"time":-1},
			5:{"time":-1},
			6:{"time":-1},
			7:{"time":-1},
			8:{"time":-1},
			9:{"time":-1},
			10:{"time":-1}
		}

func savegame():
	var savegame_f = File.new()
	savegame_f.open(PATH_SAVEGAME, File.WRITE)
	savegame_f.store_var(GLOBALS.levels)
	savegame_f.close()
	
	
func testing():
	GLOBALS.levels = {
		1:{"time":1},
		2:{"time":1},
		3:{"time":1},
		4:{"time":1},
		5:{"time":1},
		6:{"time":1},
		7:{"time":1},
		8:{"time":1},
		9:{"time":1},
		10:{"time":1}
	}