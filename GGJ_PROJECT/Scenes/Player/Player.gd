#Player.gd
class_name Player
extends KinematicBody2D

onready var player_vars = get_node("/root/PlayerVariables")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func rotate_to_mouse(_delta):
	var direction = (get_global_mouse_position() - global_position)
	player_vars.v_rotation = transform.x.angle_to(direction)
	rotate(sign(player_vars.v_rotation) * min(_delta * player_vars.ANGULAR_SPEED, abs(player_vars.v_rotation)))

#func _process(delta):
#	pass

func damage(sender: Node, damage: int):
	print('Took damage %s from %s' % [damage, sender])
	player_vars.HP -= damage
	if player_vars.HP <= 0:
		on_death(sender)

func on_death(sender: Node):
	print('YOU DIED FROM %s' % sender)
	queue_free()
