#RunState.gd
extends PlayerState

var state_name = "Run"

func _ready():
	pass


func update(delta: float):
	player.v_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	player.v_direction.normalized()  * player.MOVE_SPEED
	if player.v_direction == Vector2.ZERO:
		state_machine.transition_to("Idle")

func physics_update(delta: float):
	player.rotate_to_mouse(delta)
	player.velocity.x = player.v_direction.x * player.MOVE_SPEED
	player.velocity.y = player.v_direction.y * player.MOVE_SPEED
	player.move_and_slide(player.velocity)
