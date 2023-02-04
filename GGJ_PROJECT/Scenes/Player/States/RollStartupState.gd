#RollStartupState.gd
extends PlayerState

var state_name = "RollStartup"
var frame_counter = 0

func enter(_msg := {}) -> void:
	player.v_direction = (player.get_global_mouse_position() - player.position).normalized()
func update(_delta: float):
	pass

func physics_update(_delta: float):
	player.velocity.x = player.v_direction.x * player.MOVE_SPEED
	player.velocity.y = player.v_direction.y * player.MOVE_SPEED
	player.move_and_slide(player.velocity)
	frame_counter += 1
	if frame_counter > (player.ROLL_STARTUP):
		frame_counter = 0
		state_machine.transition_to("RollActive")
	
