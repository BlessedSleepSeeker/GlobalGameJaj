# Idle.gd
extends PlayerState

var state_name = "Idle"

func enter(_msg := {}) -> void:
	if _msg.has("cutscene"):
		state_machine.transition_to("CinematicState")
	player_vars.velocity = Vector2.ZERO


func update(delta: float) -> void:
	player_vars.v_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()
	player.rotate_to_mouse(delta)
	if player_vars.v_direction != Vector2.ZERO: 
		state_machine.transition_to("Run")
	if Input.is_action_pressed("roll"):
		state_machine.transition_to("RollStartup")
	if Input.is_action_pressed("attack"):
		state_machine.transition_to("AttackStartup")
	if Input.is_action_pressed("interact"):
		state_machine.transition_to("Interaction")
