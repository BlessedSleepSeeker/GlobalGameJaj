extends Node2D
class_name BaseRoom

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const VOID = -1
const GROUND = 0
const WALL = 1
const DOOR_START = 2
const DOOR_EXIT_1 = 3
const DOOR_EXIT_2 = 4
const HOLE = 5
const OBJECT_DESTR = 6
const OBJECT_INDESTR = 7
const ENEMY_1_SPAWN_POINT = 8


export(Resource) var _ground # 0
export(Resource) var _wall # 1
export(Resource) var _door_start # 2
export(Resource) var _hole # 5
export(Resource) var _object_destructible # 6
export(Resource) var _object_indestructible # 7
export(Resource) var _enemy_1 # 7 
export(Resource) var _door_exit_1 # 3
export(Resource) var _door_exit_2 # 4


export(int) var room_size_x = 30
export(int) var room_size_y = 20

var start_offset_x := 0
var start_offset_y := 0
var map_as_array : Array = []

var _room_type := "Fight"


var _map = [
	[1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 1, 1],
[1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 1],
[1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 7, 1],
[1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 1],
[1, 0, 0, 5, 5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
[1, 0, 0, 5, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
[1, 0, 0, 5, 5, 5, 7, 7, 0, 0, 0, 0, 0, 0, 0, 0, 1],
[1, 0, 0, 0, 0, 0, 0, 0, 0, 5, 1, 1, 1, 1, 1, 1, 1],
[1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
[1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
[1, 0, 1, 0, 0, 0, 5, 0, 0, 0, 0, 0, 1],
[1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
[1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
[1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 1, 1],
[1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 1],
[1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1],
[1, 0, 0, 8, 0, 0, 0, 0, 1],
[1, 0, 0, 0, 0, 0, 0, 0, 1],
[1, 1, 1, 1, 1, 2, 1, 1, 1]]

func _init():
	pass
	# for i in room_size_y:
	# 	var map_slice := []
	# 	map_slice.resize(room_size_x)
	# 	map_slice.fill(GROUND)
	# 	map_as_array.append(map_slice)
	# #print_map_array()
	# generate_wall()


func generate_wall():
	pass
	# map_as_array[0].fill(WALL)
	# map_as_array[-1].fill(WALL)
	# for i in map_as_array:
	# 	i[0] = WALL
	# 	i[-1] = WALL

# Where we generate the map in the world
func _ready():
	var offset_x := 0
	var offset_y := 0

	for i in _map:
		for j in i:
			var tile
			var is_void := false
			match j:
				GROUND:
					tile = _ground.instance()
				WALL:
					tile = _wall.instance()
				DOOR_START:
					tile = _door_start.instance()
					start_offset_x = offset_x
					start_offset_y = offset_y
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
				ENEMY_1_SPAWN_POINT:
					tile = _ground.instance()
					var enemy = _enemy_1.instance()
					call_deferred("add_child", enemy)
					enemy.position.x = offset_x
					enemy.position.y = offset_y
				VOID:
					is_void = true
				_:
					is_void = true
			if (!is_void):
				call_deferred("add_child", tile)
				tile.position.x = offset_x
				tile.position.y = offset_y
			offset_x += 32
		offset_y += 32
		offset_x = 0


func move_player_to_start(player: Player):
	player.position.x = start_offset_x
	player.position.y = start_offset_y - 32


func print_map_array():
	for i in map_as_array:
		print(i)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
