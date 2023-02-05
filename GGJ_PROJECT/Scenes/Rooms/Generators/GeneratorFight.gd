extends Node

var rng = RandomNumberGenerator.new()
var seeding

var game_state

# Called when the node enters the scene tree for the first time.
func _ready():
	seeding = get_node("/root/Seeding")
	game_state = get_node("/root/GameState")

func act_one() -> BaseRoom:
	game_state.current_room_type = "Fight"
	var demo = load("res://Scenes/Rooms/RoomTemplates/DemoRoomCombat/CombatRoom.tscn")
	return demo.instance()