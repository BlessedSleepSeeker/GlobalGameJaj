#RollStartupState.gd
extends PlayerState

var state_name = "RollStartup"
var frame_counter = 0

func enter(_msg := {}) -> void:
	player_vars.v_direction = (player.get_global_mouse_position() - player.position).normalized()
func update(_delta: float):
	pass

func physics_update(_delta: float):
	player_vars.velocity.x = player_vars.v_direction.x * player_vars.MOVE_SPEED
	player_vars.velocity.y = player_vars.v_direction.y * player_vars.MOVE_SPEED
	player.move_and_slide(player_vars.velocity)
	frame_counter += 1
	if frame_counter > (player_vars.ROLL_STARTUP):
		frame_counter = 0
		state_machine.transition_to("RollActive")
	
