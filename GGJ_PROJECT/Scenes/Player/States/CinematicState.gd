# CinematicState.gd
extends PlayerState

var state_name = "Cinematic"

func enter(_msg := {}) -> void:
	get_parent().connect("cinematic_end", self, "_on_cinematic_end") 

func update(_delta: float):
	pass

func physics_update(_delta: float):
	pass
	
func _on_cinematic_end():
	state_machine.transition_to("Idle")
