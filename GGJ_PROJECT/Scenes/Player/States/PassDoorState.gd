# PassDoorState.gd
extends PlayerState

var state_name = "PassDoor"

func _ready():
	pass

func enter(_msg := {}) -> void:
	print('ENTERED')
	player_vars.v_direction = Vector2(0, -1)
	
func update(_delta: float):
	pass

func physics_update(_delta: float):
	player.rotate_to_abs(9, _delta)
	player_vars.velocity.x = player_vars.v_direction.x * player_vars.MOVE_SPEED_PASS_DOOR
	player_vars.velocity.y = player_vars.v_direction.y * player_vars.MOVE_SPEED_PASS_DOOR
	player.move_and_slide(player_vars.velocity)

func _on_finish():
	state_machine.transition_to("Idle")
