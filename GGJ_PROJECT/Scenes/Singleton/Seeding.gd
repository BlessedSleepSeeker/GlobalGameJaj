extends Node

var rng = RandomNumberGenerator.new()
var MAIN_SEED = ''
var ANCESTOR_GENERATION_SEED = ''

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

func resetSeeds():
	rng.randomize()
	MAIN_SEED = ''
	ANCESTOR_GENERATION_SEED = ''
