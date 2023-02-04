#RollStartupState.gd
extends PlayerState

var state_name = "RollStartup"

func _ready():
	player.v_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")

func update(delta: float):
	pass

func physics_update(delta: float):
	pass
