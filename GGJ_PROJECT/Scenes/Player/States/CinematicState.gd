# CinematicState.gd
extends PlayerState

var state_name = "Cinematic"
var frame_counter = 0

func update(_delta: float):
	pass

func physics_update(delta: float):
	state_machine.transition_to("Idle")
