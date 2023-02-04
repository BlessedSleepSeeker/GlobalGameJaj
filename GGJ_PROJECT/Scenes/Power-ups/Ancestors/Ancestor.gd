extends Node

export var firstName = ''
export var act = ''
export var profession = ''
export var positiveTrait = ''
export var negativeTrait = ''


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_name():
	return firstName
func set_name(name):
	firstName = name

func get_act():
	return act
func set_act(given_act):
	act = given_act
	
func get_profession():
	return profession
func set_profession(given_profession):
	profession = given_profession
	
func get_positive_trait():
	return positiveTrait
func set_positive_trait(trait):
	positiveTrait = trait

func get_negative_trait():
	return negativeTrait
func set_negative_trait(trait):
	negativeTrait = trait

func display_ancestor_infos():
	print('________________')	
	print('Ancêtre : ' + get_name())
	print('Profession : ' + get_profession())
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
