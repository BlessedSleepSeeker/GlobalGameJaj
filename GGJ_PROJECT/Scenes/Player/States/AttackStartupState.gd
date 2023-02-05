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
	play_animation()
	play_sound()
	if frame_counter > (player_vars.ATTACK_STARTUP):
		frame_counter = 0
	state_machine.transition_to("AttackActive")
	
func play_sound():
	var audio_player = get_parent().get_parent().get_node("SoundEmitter")
#	var audio_stream_array = ["res://Assets/Sounds/swipe1.wav", "res://Assets/Sounds/swipe2.wav", "res://Assets/Sounds/swipe3.wav", "res://Assets/Sounds/swipe4.wav", "res://Assets/Sounds/swipe5.wav",]
	randomize()
#	var clip_to_play = audio_stream_array[randi() % audio_stream_array.size()]
#	audio_player.set_stream(clip_to_play)
	audio_player.pitch_scale = rand_range(0.5,1.0)
	audio_player.play()
	
func play_animation():
	var animation = get_parent().get_parent().get_node("SlashAnim")
	animation.visible = true
	animation.speed_scale = player_vars.ATTACK_SPEED
	if animation.frame == 0 :
		animation.play("slash")
	else:
		animation.frame = 0
		animation.flip_v = !animation.flip_v
		animation.play("slash")
