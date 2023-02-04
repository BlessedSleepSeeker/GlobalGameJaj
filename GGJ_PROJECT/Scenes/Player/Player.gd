#Player.gd
class_name Player
extends KinematicBody2D

export(float) var MOVE_SPEED = 400.0
export(float) var ANGULAR_SPEED = PI * 4
export(float) var ROLL_SPEED = 600.0

export(int) var ROLL_STARTUP = 2
export(int) var ROLL_ACTIVE = 14
export(int) var ROLL_RECOVERY = 3

export(int) var ATTACK_SPEED = 18

var v_direction := Vector2.ZERO
var v_rotation
var velocity := Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func rotate_to_mouse(_delta):
	var direction = (get_global_mouse_position() - global_position)
	v_rotation = transform.x.angle_to(direction)
	rotate(sign(v_rotation) * min(_delta * ANGULAR_SPEED, abs(v_rotation)))

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
