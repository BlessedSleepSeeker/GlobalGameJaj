class_name BaseEnemy
extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export(int) var HP = 3
export(float) var MOVE_SPEED_CHASE = 140.0
export(float) var MOVE_SPEED_PATROL = 50.0

export(int) var DAMAGE = 1
export(int) var ANGULAR_SPEED = PI

enum states { PATROL, SEARCH, CHASE, BOUNCE, GOBACK }
export(states) var cur_state = states.CHASE

var right := Vector2(1, 0)
var down := Vector2(0, 1)
var left := Vector2(-1, 0)
var up := Vector2(0, -1)

var direction := Vector2(0, 0)

export(int) var patrol_duration = 120
var patrol_frame_count := 0

onready var seeding = get_node("/root/Seeding")
onready var rng = seeding.ENEMY_AI_GENERATOR

onready var player = get_tree().get_root().get_node("Main/Player")

var search_position

var search_duration := 0
var goback_duration := 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(_delta):
	match cur_state:
		states.PATROL:
			walk(_delta)
		states.SEARCH:
			search_player(_delta)
		states.CHASE:
			chase(_delta)
		states.BOUNCE:
			bounce_(_delta)
		states.GOBACK:
			goback(_delta)

func walk(delta):
	if patrol_frame_count < patrol_duration:
		position += direction * delta * MOVE_SPEED_PATROL
		patrol_frame_count += 1
	else:
		change_ai()
		patrol_frame_count = 0

func change_ai():
	match rng.randi_range(1, 5):
		1:
			cur_state = states.PATROL
			direction = right
		2:
			cur_state = states.PATROL
			direction = left
		3:
			cur_state = states.PATROL
			direction = up
		4:
			cur_state = states.PATROL
			direction = down
		5:
			cur_state = states.SEARCH

func rotate_to(target, _delta):
	var a_direction = (target.global_position - global_position)
	var v_rotation = transform.x.angle_to(a_direction)
	rotate(sign(v_rotation) * min(_delta * ANGULAR_SPEED, abs(v_rotation)))


func get_vector_to_player() -> Vector2:
	return (player.global_position - global_position)

func search_player(_delta):
	if search_duration <= 60:
		survey_right(_delta)
	elif search_duration <= 180:
		survey_left(_delta)
	search_duration += 1
	if search_duration > 180:
		search_duration = 0
		change_ai()
	

func survey_right(_delta):
	var v_rotation = PI
	rotate(sign(v_rotation) * min(_delta * ANGULAR_SPEED, abs(v_rotation)))


func survey_left(_delta):
	var v_rotation = -PI
	rotate(sign(v_rotation) * min(_delta * ANGULAR_SPEED, abs(v_rotation)))

func chase(delta):
	rotate_to(player, delta)
	direction = get_vector_to_player().normalized()
	move(delta)

func move(delta):
	match cur_state:
		states.PATROL:
			position += direction * delta * MOVE_SPEED_PATROL
		states.CHASE:
			position += direction * delta * MOVE_SPEED_CHASE

func bounce_(delta):
	direction = direction * -1
	cur_state = states.GOBACK

func goback(delta):
	if goback_duration <= 15:
		move(delta)
		goback_duration += 1
	else:
		goback_duration = 0
		cur_state = states.PATROL


func _on_BaseEnemy_body_entered(body: Node):
	print(body.get_class())
	if body is Player:
		body.damage(self, DAMAGE)
	if body is StaticBody2D or body is BaseDoor:
		cur_state = states.BOUNCE

func take_damage(damage_taken : int):
	HP -= damage_taken
	if HP <= 0:
		queue_free()

