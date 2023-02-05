extends Node

var seeding

var game_state


func _ready():
	seeding = get_node("/root/Seeding")
	game_state = get_node("/root/GameState")


func act_one() -> BaseRoom:
	game_state.current_room_type = "Boss"
	var demo = load("res://Scenes/Rooms/RoomTemplates/DemoBoss/BossActOne.tscn")
	return demo.instance()
