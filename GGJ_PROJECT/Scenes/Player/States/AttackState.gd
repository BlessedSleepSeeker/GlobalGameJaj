# AttackState.gd
extends PlayerState

var state_name = "Attack"
var frame_counter = 0

func update(_delta: float):
	pass

func physics_update(delta: float):
	player.rotate_to_mouse(delta)
	player.velocity.x = player.v_direction.x * player.MOVE_SPEED
	player.velocity.y = player.v_direction.y * player.MOVE_SPEED
	player.move_and_slide(player.velocity)
	frame_counter += 1
	if frame_counter > (player.ATTACK_SPEED):
		frame_counter = 0
		if player.v_direction != Vector2.ZERO: 
			state_machine.transition_to("Run")
		else:
			 state_machine.transition_to("Idle")
