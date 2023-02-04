extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export(PackedScene) var player
export(PackedScene) var ui

var room_instance
var player_instance
var ui_instance

var rng
var seeding

var game_state

# Called when the node enters the scene tree for the first time.
func _ready():
	seeding = get_node("/root/Seeding")
	game_state = get_node("/root/GameState")
	rng = seeding.ROOM_GENERATOR
	rng.seed = hash(seeding.ROOM_GENERATION_SEED.sha256_text())
	rng.state = hash(seeding.ROOM_GENERATION_SEED.sha256_text())
	# generate first room based on random
	player_instance = player.instance()
	ui_instance = ui.instance()
	instance_player()
	instance_ui()
	generate_room("Fight")
	instance_room()
	room_instance.move_player_to_start(player_instance)

func generate_room(type: String):
	match game_state.current_act:
		0:
			pass
		1:
			generate_room_act_one(type)
		2:
			pass
		3:
			pass
		4:
			pass
		5:
			pass
		6:
			pass

func generate_room_act_one(type: String):
	match type:
		"Fight":
			print('GENERATING FIGHT ROOM')
			room_instance = $GeneratorFight.act_one()
			print(room_instance)
		"Dodge":
			print('GENERATING DODGE ROOM')
			room_instance = $GeneratorDodge.act_one()
			print(room_instance)
		"DodgePuzzle":
			print('GENERATING DODGEPUZZLE ROOM')
			room_instance = $GeneratorDodgePuzzle.act_one()
			print(room_instance)
		_:
			room_instance = $GeneratorFight.act_one()

func instance_room():
	add_child(room_instance)

func switch(type: String) -> void:
	flush_room()
	generate_room(type)
	instance_room()
	room_instance.move_player_to_start(player_instance)

func flush_room():
	remove_child(room_instance)

func instance_player():
	add_child(player_instance)

func instance_ui():
	add_child(ui_instance)
