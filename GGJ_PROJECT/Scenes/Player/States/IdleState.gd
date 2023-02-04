# Idle.gd
extends PlayerState

export(String) var state_name = "Idle"
# Upon entering the state, we set the Player node's velocity to zero.
func enter(_msg := {}) -> void:
	# We must declare all the properties we access through `owner` in the `Player.gd` script.
	player.velocity = Vector2.ZERO


func update(delta: float) -> void:
	player.v_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if player.v_direction != Vector2.ZERO: 
		state_machine.transition_to("Run")
