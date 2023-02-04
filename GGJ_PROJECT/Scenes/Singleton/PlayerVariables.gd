extends Node

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
