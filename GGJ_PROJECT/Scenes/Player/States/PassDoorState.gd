# PassDoorState.gd
extends PlayerState

var state_name = "PassDoor"

func enter(_msg := {}) -> void:
	pass
	
func update(_delta: float):
	pass

func physics_update(_delta: float):
	pass
	
func _on_past_door():
	state_machine.transition_to("Idle")
