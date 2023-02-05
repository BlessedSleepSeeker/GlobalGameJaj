extends Node

var rng = RandomNumberGenerator.new()
var seeding

var game_state


func _ready():
	seeding = get_node("/root/Seeding")
	game_state = get_node("/root/GameState")


func act_one() -> BaseRoom:
	var demo = load("res://Scenes/Rooms/RoomTemplates/DodgeRoom/DodgeRoom.tscn")
	return demo.instance()
