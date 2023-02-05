# PassDoorState.gd
extends PlayerState

var state_name = "PassDoor"

func enter(_msg := {}) -> void:
	get_parent().connect("finish_pass", self, "_on_finish")
	
func update(_delta: float):
	pass

func physics_update(_delta: float):
	pass
	
func _on_finish():
	state_machine.transition_to("Idle")
