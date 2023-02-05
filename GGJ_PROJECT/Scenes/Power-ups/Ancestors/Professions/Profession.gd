extends Node

export var professionName = ''
export var description = ''
export var entity = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_sub_entity(fileName):
	entity = load(fileName).new()
	professionName = entity.professionName
	description = entity.description
	
func get_name():
	return professionName
	
func get_description():
	return description
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
