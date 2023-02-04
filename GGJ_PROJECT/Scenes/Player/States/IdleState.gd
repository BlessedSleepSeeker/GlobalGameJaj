# Idle.gd
extends PlayerState

var state_name = "Idle"

func enter(_msg := {}) -> void:
	player.velocity = Vector2.ZERO


func update(_delta: float) -> void:
	player.v_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()
	if player.v_direction != Vector2.ZERO: 
		state_machine.transition_to("Run")
	if Input.is_action_pressed("roll"):
		state_machine.transition_to("RollStartup")
