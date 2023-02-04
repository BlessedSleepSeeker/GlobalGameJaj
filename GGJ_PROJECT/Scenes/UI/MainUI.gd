extends CanvasLayer

var player
var state_machine
var label

var format_string = "X = %d\nY = %d\nDir = %d\nState = %s\nInput = [%f, %f]"

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_parent().get_node("BaseRoom/Player")
	state_machine = player.get_node("StateMachine")
	label = $Margin/RowSplit/DebuggingDisplay


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var state = state_machine.state.name
	label.text = format_string % [player.position.x, player.position.y, player.rotation, state, player.v_direction.x, player.v_direction.y]
