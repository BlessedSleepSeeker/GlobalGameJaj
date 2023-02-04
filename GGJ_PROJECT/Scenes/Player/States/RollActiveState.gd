#RollActiveState.gd
extends PlayerState

var state_name = "RollActive"
var frame_counter = 0

func enter(_msg := {}) -> void:
	pass

func update(_delta: float):
	pass

func physics_update(_delta: float):
	player.velocity.x = player.v_direction.x * player.MOVE_SPEED
	player.velocity.y = player.v_direction.y * player.MOVE_SPEED
	player.move_and_slide(player.velocity)
	get_parent().get_parent().get_node("Hitbox").disabled = true
	frame_counter += 1
	if frame_counter > (player.ROLL_ACTIVE):
		frame_counter = 0
		state_machine.transition_to("RollRecovery")
