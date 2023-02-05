# AttackStartupState.gd
extends PlayerState

var state_name = "AttackStartup"
var frame_counter = 0

func update(_delta: float):
	pass

func physics_update(delta: float):
	player_vars.v_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()
	player.rotate_to_mouse(delta)
	player_vars.velocity.x = player_vars.v_direction.x * player_vars.MOVE_SPEED
	player_vars.velocity.y = player_vars.v_direction.y * player_vars.MOVE_SPEED
	player.move_and_slide(player_vars.velocity)
	frame_counter += 1
	get_parent().get_parent().get_node("SlashAnim").visible = true
	get_parent().get_parent().get_node("SlashAnim").speed_scale = player_vars.ATTACK_SPEED
	var animation_flip = get_parent().get_parent().get_node("SlashAnim").flip_v
	animation_flip = !animation_flip
	if get_parent().get_parent().get_node("SlashAnim").frame == 0 :
		get_parent().get_parent().get_node("SlashAnim").play("slash")
	else:
		get_parent().get_parent().get_node("SlashAnim").frame = 0
		get_parent().get_parent().get_node("SlashAnim").flip_v = !get_parent().get_parent().get_node("SlashAnim").flip_v
		get_parent().get_parent().get_node("SlashAnim").play("slash")
	print(animation_flip)
#	else:
#		!get_parent().get_parent().get_node("SlashAnim").flip_v
#		get_parent().get_parent().get_node("SlashAnim").play("slash", true)
	if frame_counter > (player_vars.ATTACK_STARTUP):
		frame_counter = 0
	state_machine.transition_to("AttackActive")
