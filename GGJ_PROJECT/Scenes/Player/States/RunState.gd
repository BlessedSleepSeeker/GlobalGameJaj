extends PlayerState

export(String) var state_name = "Run"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	player.v_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	player.v_direction.normalized()  * player.MOVE_SPEED
	print_debug(state_name)
	if player.v_direction == Vector2.ZERO:
		state_machine.transition_to("Idle")

func _physics_process(delta):
	player.rotate_to_mouse(delta)
	player.velocity.x = player.v_direction.x * player.MOVE_SPEED
	player.velocity.y = player.v_direction.y * player.MOVE_SPEED
	player.move_and_slide(player.velocity)
