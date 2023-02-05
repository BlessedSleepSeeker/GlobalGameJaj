#RollStartupState.gd
extends PlayerState

var state_name = "RollStartup"
var frame_counter = 0


func enter(_msg := {}) -> void:
	player_vars.v_direction = (player.get_global_mouse_position() - player.position).normalized()

func update(_delta: float):
	pass

func physics_update(_delta: float):
	player_vars.velocity.x = player_vars.v_direction.x * player_vars.ROLL_SPEED
	player_vars.velocity.y = player_vars.v_direction.y * player_vars.ROLL_SPEED
	player.move_and_slide(player_vars.velocity)
	play_sound()
	frame_counter += 1
	if frame_counter > (player_vars.ROLL_STARTUP):
		frame_counter = 0
		state_machine.transition_to("RollActive")

func play_sound():
	var audio_player = get_parent().get_parent().get_node("SoundEmitter")
	var audio_file = "res://Assets/Sounds/roll.wav"
	if File.new().file_exists(audio_file):
		var sfx = load(audio_file)
		audio_player.set_stream(sfx)
		randomize()
		audio_player.pitch_scale = rand_range(0.5,1.0)
		audio_player.play()
