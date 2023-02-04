extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const GROUND = 0
const WALL = 1
const DOOR_START = 2
const DOOR_EXIT_1 = 3
const DOOR_EXIT_2 = 4
const HOLE = 5
const OBJECT_DESTR = 6
const OBJECT_INDESTR = 7


export(Resource) var _ground # 0
export(Resource) var _wall # 1
export(Resource) var _door_start # 2
export(Resource) var _door_exit_1 # 3
export(Resource) var _door_exit_2 # 4
export(Resource) var _hole # 5
export(Resource) var _object_destructible # 6
export(Resource) var _object_indestructible # 7 


export(int) var room_size_x = 10
export(int) var room_size_y = 10

var map_as_array : Array = []

var test_map = [[1, 1, 1, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 2, 3, 4, 5, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 6, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 7, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 1, 1, 1]]

func _init():
	var map_slice = []
	map_slice.resize(room_size_x)
	map_slice.fill(0)
	map_as_array.resize(room_size_y)
	map_as_array.fill(map_slice.duplicate())
	print_map_array()

# Where we generate the map in the world
func _ready():
	var offset_x := 0
	var offset_y := 0

	for i in map_as_array:
		for j in i:
			var tile
			match j:
				GROUND:
					tile = _ground.instance()
				WALL:
					tile = _wall.instance()
				DOOR_START:
					tile = _door_start.instance()
				DOOR_EXIT_1:
					tile = _door_exit_1.instance()
				DOOR_EXIT_2:
					tile = _door_exit_2.instance()
				HOLE:
					tile = _hole.instance()
				OBJECT_DESTR:
					tile = _object_destructible.instance()
				OBJECT_INDESTR:
					tile = _object_indestructible.instance()
			add_child(tile)
			tile.position.x = offset_x
			tile.position.y = offset_y
			offset_x += 32
		offset_y += 32
		offset_x = 0
					




func print_map_array():
	for i in map_as_array:
		print(i)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
