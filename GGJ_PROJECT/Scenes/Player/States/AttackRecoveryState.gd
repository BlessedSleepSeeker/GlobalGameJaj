# AttackRecoveryState.gd
extends PlayerState

var state_name = "AttackRecovery"
var frame_counter = 0

func update(_delta: float):
	pass

func physics_update(delta: float):
	player_vars.v_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()
	player.rotate_to_mouse(delta)
	player_vars.velocity.x = player_vars.v_direction.x * player_vars.MOVE_SPEED
	player_vars.velocity.y = player_vars.v_direction.y * player_vars.MOVE_SPEED
	player.move_and_slide(player_vars.velocity)
	frame_counter += 1
	if frame_counter > (player_vars.ATTACK_RECOVERY):
		frame_counter = 0
		if player_vars.v_direction != Vector2.ZERO: 
			state_machine.transition_to("Run")
		else:
			 state_machine.transition_to("Idle")