class_name Player
extends KinematicBody2D

export(int) var HP = 6
export(float) var MOVE_SPEED = 500.0
export(float) var ANGULAR_SPEED = PI * 2
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

#func _process(delta):
#	pass

func damage(sender: Node, damage: int):
	print('Took damage %s from %s' % [damage, sender])
	HP -= damage
	if HP <= 0:
		on_death(sender)

func on_death(sender: Node):
	print('YOU DIED FROM %s' % sender)
	queue_free()
