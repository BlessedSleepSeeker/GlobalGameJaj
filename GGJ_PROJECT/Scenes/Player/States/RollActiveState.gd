#RollActiveState.gd
extends PlayerState

var state_name = "RollActive"
var frame_counter = 0



func enter(_msg := {}) -> void:
	pass

func update(_delta: float):
	pass

func physics_update(_delta: float):
	player_vars.velocity.x = player_vars.v_direction.x * player_vars.ROLL_SPEED
	player_vars.velocity.y = player_vars.v_direction.y * player_vars.ROLL_SPEED
	player.move_and_slide(player_vars.velocity)
	#TODO: Rendre invincible le personnage
	#get_parent().get_parent().get_node("Hurtbox").disabled = true
	frame_counter += 1
	if frame_counter > (player_vars.ROLL_ACTIVE):
		frame_counter = 0
		state_machine.transition_to("RollRecovery")
