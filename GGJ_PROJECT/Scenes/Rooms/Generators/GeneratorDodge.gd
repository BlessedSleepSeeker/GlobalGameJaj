extends Node

var seeding

var game_state


func _ready():
	seeding = get_node("/root/Seeding")
	game_state = get_node("/root/GameState")


func act_one() -> BaseRoom:
	game_state.current_room_type = "Dodge"
	var demo = load("res://Scenes/Rooms/RoomTemplates/DodgeRoom/DodgeRoom.tscn")
	return demo.instance()
