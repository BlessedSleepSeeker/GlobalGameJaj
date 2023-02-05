extends Node
onready var default_values = get_node("/root/DefaultValues")

export(int) var MAX_HP = 6
export(int) var HP = 6
export(float) var MOVE_SPEED = 150.0
export(float) var ANGULAR_SPEED = PI * 4
export(float) var ROLL_SPEED = 260.0

export(int) var ROLL_STARTUP = 2
export(int) var ROLL_ACTIVE = 14
export(int) var ROLL_RECOVERY = 3


export(int) var ATTACK_STARTUP = 3
export(int) var ATTACK_ACTIVE = 0
export(int) var ATTACK_RECOVERY = 25
export(int) var BASE_ATTACK_DAMAGE = 1

var v_direction := Vector2.ZERO
var v_rotation
var velocity := Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func reset_values():
	HP = default_values.DEFAULT_PLAYER_HP
	MOVE_SPEED = default_values.DEFAULT_MOVE_SPEED
	ANGULAR_SPEED = default_values.DEFAULT_ANGULAR_SPEED
	ROLL_STARTUP = default_values.DEFAULT_ROLL_STARTUP
	ROLL_ACTIVE = default_values.DEFAULT_ROLL_ACTIVE
	ROLL_RECOVERY = default_values.DEFAULT_ROLL_RECOVERY
	ATTACK_STARTUP = default_values.DEFAULT_ATTACK_STARTUP
	ATTACK_ACTIVE = default_values.DEFAULT_ATTACK_ACTIVE
	ATTACK_RECOVERY = default_values.DEFAULT_ATTACK_RECOVERY
	BASE_ATTACK_DAMAGE = default_values.DEFAULT_BASE_ATTACK_DAMAGE
