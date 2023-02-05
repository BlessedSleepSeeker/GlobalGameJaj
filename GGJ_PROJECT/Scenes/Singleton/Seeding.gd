extends Node

var rng = RandomNumberGenerator.new()
var MAIN_SEED = ''
var ANCESTOR_GENERATION_SEED = ''
var ROOM_GENERATION_SEED = ''
var ENEMY_MOVEMENT_SEED = ''

var ROOM_GENERATOR = RandomNumberGenerator.new()
var ENEMY_AI_GENERATOR = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func generateSeeds():
	if (MAIN_SEED == ''):
		rng.randomize()
		rng.seed = hash(rng.randi())
	else:
		rng.seed = hash(MAIN_SEED.sha256_text())
		rng.state = hash(MAIN_SEED.sha256_text())
		rng.randi()
	ANCESTOR_GENERATION_SEED = hash(rng.randi())
	ROOM_GENERATION_SEED = hash(rng.randi())
	ROOM_GENERATOR.seed = hash(ROOM_GENERATION_SEED)
	ROOM_GENERATOR.state = hash(ROOM_GENERATION_SEED)
	
	ENEMY_MOVEMENT_SEED = hash(rng.randi())
	ENEMY_AI_GENERATOR.seed = hash(ENEMY_MOVEMENT_SEED)
	ENEMY_AI_GENERATOR.state = hash(ENEMY_MOVEMENT_SEED)

func resetSeeds():
	rng.randomize()
	MAIN_SEED = ''
	ANCESTOR_GENERATION_SEED = ''
	ROOM_GENERATION_SEED = ''
	ENEMY_MOVEMENT_SEED = ''
