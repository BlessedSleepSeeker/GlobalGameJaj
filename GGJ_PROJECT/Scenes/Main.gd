#Main.gd
extends Node

var actual_state := "Actual State : "

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var player_state: String = $Player/StateMachine.state.state_name
	$RichTextLabel.text = actual_state + player_state
