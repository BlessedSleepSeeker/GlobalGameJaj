extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export(int) var HP := 3
export(float) var MOVE_SPEED := 300.0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_BaseEnemy_body_shape_entered():
	print('AAAAAAAA')