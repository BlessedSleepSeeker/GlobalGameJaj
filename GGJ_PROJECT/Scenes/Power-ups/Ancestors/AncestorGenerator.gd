extends Node

const pools = ['act1', 'act2', 'act3', 'act4', 'act5']
const namesPool = [
	{'act1': ['Marie', 'Mélanie', 'Emilie', 'Hélène', 'Emma', 'Johnny', 'Camille', 'Adrien', 'Antoine', 'Thomas']},
	{'act2': ['Jacqueline', 'Jeanne', 'Huguette', 'Bernadette', 'Monique', 'Louis', 'Pierre', 'Paul', 'René', 'Georges']},
	{'act3': ['Clotilde', 'Pétronille', 'Gerberge', 'Bathilde', 'Hermine', 'Eudes', 'Conrad', 'Folquet', 'Gaubert', 'Godefroy']},
	{'act4': ['Amogus', 'Confucius', 'Autobus', 'Augustus', 'Asmongoldus', 'Barbus', 'Brutus', 'Abominatiogus']},
	{'act5': ['Ouga', 'Bouga', 'Nega', 'Gaga', 'FF Fast']},
]

var professions = load('res://Scenes/Power-ups/Ancestors/Professions/Profession.gd').new()

var pullAncestorAct1 = []
var pullAncestorAct2 = []
var pullAncestorAct3 = []
var pullAncestorAct4 = []
var pullAncestorAct5 = []

# Called when the node enters the scene tree for the first time.
func _ready():
	# TODO : Use RandomNumberGenerator from singleton instead
	var rng = RandomNumberGenerator.new()
	rng.seed = hash('Amogus')
	
	for i in range(pools.size()):
		for j in 3:
			generateAncestor(i, rng)
	for uwu in range(pullAncestorAct1.size()):
		print(pullAncestorAct1[uwu].get_name())
		print(pullAncestorAct2[uwu].get_name())
		print(pullAncestorAct3[uwu].get_name())
		print(pullAncestorAct4[uwu].get_name())
		print(pullAncestorAct5[uwu].get_name())


func generateAncestor(poolIndex, rng):
	var ancestor = load('res://Scenes/Power-ups/Ancestors/Ancestor.gd').new()
	var act = pools[poolIndex]
	
	ancestor.set_act(act)
	ancestor.set_name(generate_name(act, rng)) # TODO : Generate name randomly according to seed
	ancestor.set_profession(generate_profession(act, rng)) # TODO : Generate name randomly according to seed
	push_ancestor_to_pull(ancestor)

func push_ancestor_to_pull(ancestor):
	var act = ancestor.get_act()
	match act:
		'act1': pullAncestorAct1.append(ancestor)
		'act2': pullAncestorAct2.append(ancestor)
		'act3': pullAncestorAct3.append(ancestor)
		'act4': pullAncestorAct4.append(ancestor)
		'act5': pullAncestorAct5.append(ancestor)
		
func generate_name(act, rng):
	var availableNames = ['Default']
	for i in range(namesPool.size()):
		if namesPool[i].has(act):
			availableNames = namesPool[i][act]
	var randomIndex = rng.randi_range(0, availableNames.size() - 1)
	return availableNames[randomIndex]
	
func generate_profession(act, rng):
	var availablesProfessions = []
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
