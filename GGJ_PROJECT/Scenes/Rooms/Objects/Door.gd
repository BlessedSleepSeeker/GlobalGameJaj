extends Area2D
class_name BaseDoor

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


export(bool) var is_open = false

export(Texture) var open_text
export(Texture) var closed_text

onready var scene_switcher = get_tree().root.get_node("Main")

var lead_to : String
var seeding

# Called when the node enters the scene tree for the first time.
func _ready():
	seeding = get_node("/root/Seeding")
	if is_open:
		self.connect("body_entered", self, "walked_on_door")
	update_sprite()
	chose_destination()

func chose_destination():
	match seeding.ROOM_GENERATOR.randi_range(1, 3):
		1:
			lead_to = "Fight"
		2:
			lead_to = "Dodge"
		3:
			lead_to = "DodgePuzzle"

func open_door():
	is_open = true
	update_sprite()

func close_door():
	is_open = false
	update_sprite()

func update_sprite():
	if is_open:
		$Sprite.texture = open_text
	else:
		$Sprite.texture = closed_text

func walked_on_door(body: Node):
	if body is Player:
		scene_switcher.switch(lead_to)

func _physics_process(_delta):
	pass
