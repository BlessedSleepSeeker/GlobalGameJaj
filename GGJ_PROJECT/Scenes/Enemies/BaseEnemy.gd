class_name BaseEnemy
extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export(int) var HP = 3
export(float) var MOVE_SPEED = 300.0

export(int) var DAMAGE = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if HP <= 0:
		hide()

func _on_BaseEnemy_body_entered(body: Node):
	if body is Player:
		body.damage(self, DAMAGE)
		
func take_damage(damage_taken : int):
	HP -= damage_taken
	print(HP)

