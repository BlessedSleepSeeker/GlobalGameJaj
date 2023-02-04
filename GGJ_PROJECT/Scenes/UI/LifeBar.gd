extends HBoxContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export(PackedScene) var heart

onready var player_vars = get_node("/root/PlayerVariables")

var hearts

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in player_vars.MAX_HP:
		add_child(heart.instance())
	hearts = get_children()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var it = 1
	for i in hearts:
		if it <= player_vars.HP:
			i.fill()
		else:
			i.empty()
		it += 1
