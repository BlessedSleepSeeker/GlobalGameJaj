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
var room_type
var first_room := true

signal door_enter
signal door_exit

# Called when the node enters the scene tree for the first time.
func _ready():
	seeding = get_node("/root/Seeding")
	game_state = get_node("/root/GameState")
	rng = seeding.ROOM_GENERATOR
	rng.seed = hash(seeding.ROOM_GENERATION_SEED)
	rng.state = hash(seeding.ROOM_GENERATION_SEED)
	# generate first room based on random
	player_instance = player.instance()
	ui_instance = ui.instance()

	# generate first room based on random
	switch("Dodge")


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
			room_instance = $GeneratorFight.act_one()
			print(room_instance)
		"Dodge":
			room_instance = $GeneratorDodge.act_one()
			print(room_instance)
		"DodgePuzzle":
			room_instance = $GeneratorDodgePuzzle.act_one()
			print(room_instance)
		"Boss":
			room_instance = $GeneratorBoss.act_one()
			print(room_instance)
		_:
			room_instance = $GeneratorFight.act_one()

func instance_room():
	add_child(room_instance)

func switch(type: String) -> void:
	print("emit door_enter")
	emit_signal("door_enter")
	room_type = type
	$SceneTransition.transition()

func _on_SceneTransition_transitionned():
	flush_room()
	generate_room(room_type)
	instance_room()
	
	if first_room:
		first_room = not first_room
		instance_player()
		instance_ui()

	room_instance.move_player_to_start(player_instance)
	game_state.current_room_number += 1
	print("emit door_exit")
	emit_signal("door_exit")

func flush_room():
	if room_instance:
		call_deferred("remove_child", room_instance)

func instance_player():
	call_deferred("add_child", player_instance)

func instance_ui():
	call_deferred("add_child", ui_instance)
