# Idle.gd
extends PlayerState

var state_name = "Idle"

func enter(_msg := {}) -> void:
	player.velocity = Vector2.ZERO


func update(delta: float) -> void:
	player.v_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if player.v_direction != Vector2.ZERO: 
		state_machine.transition_to("Run")
	if Input.action_press("roll"):
		state_machine.transition_to("RollStartup")
