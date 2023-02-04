extends Node

export var firstName = ''
export var act = ''
export var profession = {}
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
func set_act(givenAct):
	act = givenAct
	
func get_profession_name():
	return profession.professionName
func get_profession_description():
	return profession.description
func set_profession(professionFileName):
	var subEntityUrl = 'res://Scenes/Power-ups/Ancestors/Professions/%s.gd'
	var professionEntity = load('res://Scenes/Power-ups/Ancestors/Professions/Profession.tscn').instance()
	professionEntity.set_sub_entity(subEntityUrl % professionFileName)
	profession = professionEntity
	
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
	print(get_name())
	print('Profession : ' + get_profession_name())
	print('"' + get_profession_description() + '"')
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
