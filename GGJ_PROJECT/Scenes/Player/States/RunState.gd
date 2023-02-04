#RunState.gd
extends PlayerState

var state_name = "Run"

func enter(_msg := {}) -> void:
	pass


func update(_delta: float):
	player_vars.v_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()
	if player_vars.v_direction == Vector2.ZERO:
		state_machine.transition_to("Idle")
	if Input.is_action_pressed("roll"):
		state_machine.transition_to("RollStartup")
	if Input.is_action_pressed("attack"):
		state_machine.transition_to("Attack")
	if Input.is_action_pressed("interact"):
		state_machine.transition_to("Interaction")

func physics_update(delta: float):
	player.rotate_to_mouse(delta)
	player_vars.velocity.x = player_vars.v_direction.x * player_vars.MOVE_SPEED
	player_vars.velocity.y = player_vars.v_direction.y * player_vars.MOVE_SPEED
	player.move_and_slide(player_vars.velocity)
