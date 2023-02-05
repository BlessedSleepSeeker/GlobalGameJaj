extends CanvasLayer

onready var player_vars = get_node("/root/PlayerVariables")
var player
var state_machine
var label
var game_state

var format_string = "X = %d\nY = %d\nDir = %d\nState = %s\nInput = [%f, %f]\nRoom %d : %s"

# Called when the node enters the scene tree for the first time.
func _ready():
	game_state = get_node("/root/GameState")
	player = get_parent().get_node("Player")
	state_machine = player.get_node("StateMachine")
	label = $Margin/RowSplit/DebuggingDisplay


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var state = state_machine.state.name
	label.text = format_string % [player.position.x, player.position.y, rad2deg(player.rotation), state, player_vars.v_direction.x, player_vars.v_direction.y, game_state.current_room_number, game_state.current_room_type]

