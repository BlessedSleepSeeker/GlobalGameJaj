#RollRecoveryState.gd
extends PlayerState

var state_name = "RollRecovery"
var frame_counter = 0

func enter(_msg := {}) -> void:
	pass

func update(_delta: float):
	pass

func physics_update(_delta: float):
	player_vars.v_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()
	frame_counter += 1
	if frame_counter > (player_vars.ROLL_RECOVERY):
		frame_counter = 0
		if player_vars.v_direction != Vector2.ZERO: 
			state_machine.transition_to("Run")
		else:
			 state_machine.transition_to("Idle")
