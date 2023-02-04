extends Node

export var professionName = ''
export var act = ''
export var description = ''


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_name():
	return professionName
func set_name(name):
	professionName = name

func get_act():
	return act
func set_act(given_act):
	act = given_act

func get_description():
	return description
func set_description(given_description):
	description = given_description


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
