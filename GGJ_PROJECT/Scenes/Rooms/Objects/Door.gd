extends Area2D
class_name BaseDoor

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


export(bool) var is_open = false

onready var scene_switcher = get_tree().root.get_node("Main")

var lead_to : String

onready var _animated_sprite = $AnimatedSprite

var game_state
var seeding

# Called when the node enters the scene tree for the first time.
func _ready():
	seeding = get_node("/root/Seeding")
	game_state = get_node("/root/GameState")
	update_sprite()
	chose_destination()

func chose_destination():
	if game_state.current_room_number == 9:
		lead_to = "Boss"
		return
	if game_state.current_room_type == "Fight":
		match seeding.ROOM_GENERATOR.randi_range(1, 10):
			1, 2:
				lead_to = "Fight"
			3, 4, 5, 6:
				lead_to = "Dodge"
			7, 8, 9, 10:
				lead_to = "DodgePuzzle"
	elif game_state.current_room_type == "Dodge":
		match seeding.ROOM_GENERATOR.randi_range(1, 10):
			1, 2:
				lead_to = "Dodge"
			3, 4, 5, 6:
				lead_to = "Fight"
			7, 8, 9, 10:
				lead_to = "DodgePuzzle"
	elif game_state.current_room_type == "DodgePuzzle":
		match seeding.ROOM_GENERATOR.randi_range(1, 10):
			1, 2:
				lead_to = "DodgePuzzle"
			3, 4, 5, 6:
				lead_to = "Dodge"
			7, 8, 9, 10:
				lead_to = "Fight"

func open_door():
	is_open = true
	_animated_sprite.play("opening")
	self.connect("body_entered", self, "walked_on_door")

func close_door():
	is_open = false
	_animated_sprite.frame = 0
	self.disconnect("body_entered", self, "walked_on_door")

func update_sprite():
	pass

func walked_on_door(body: Node):
	if body is Player and is_open:
		scene_switcher.switch(lead_to)

func _physics_process(_delta):
	pass

func _on_OpeningTimer_timeout():
	open_door()
