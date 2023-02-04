extends Node

onready var seeding = get_node("/root/Seeding")
const pools = ['act1', 'act2', 'act3', 'act4', 'act5']
const NAMES_POOL = [
	{'act1': ['Marie', 'Mélanie', 'Emilie', 'Hélène', 'Emma', 'Johnny', 'Camille', 'Adrien', 'Antoine', 'Thomas']},
	{'act2': ['Jacqueline', 'Jeanne', 'Huguette', 'Bernadette', 'Monique', 'Louis', 'Pierre', 'Paul', 'René', 'Georges']},
	{'act3': ['Clotilde', 'Pétronille', 'Gerberge', 'Bathilde', 'Hermine', 'Eudes', 'Conrad', 'Folquet', 'Gaubert', 'Godefroy']},
	{'act4': ['Calliope', 'Danaé', 'Hécate', 'Pasiphaé', 'Terpsichore', 'Anaxímandros', 'Thrasymaquos', 'Marcus-Aurelius', 'Hyppolytus', 'Tybaltus']},
	{'act5': ['Ouga', 'Bouga', 'Nega', 'Gaga', 'FF Fast']}
]
const PROFESSIONS_POOL = [
	{'act1': ['Professeur', 'Informaticien', 'PiloteDeLigne', 'Avocat', 'Sociologue', 'Demenageur']},
	{'act2': ['Ouvrier', 'RenifleurDeCafe', 'Corsaire', 'PhilosopheLumiere', 'Ebeniste']},
	{'act3': ['Paysan', 'Vigneron', 'Chevalier', 'Apothicaire', 'Bouffon', 'Explorateur']},
	{'act4': ['Esclave', 'ConducteurDeChar', 'Soldat', 'PhilosopheAntique', 'Magistrat', 'AthleteOlympique']},
	{'act5': ['Chasseur', 'Cueilleur', 'Pecheur', 'ChefDeTribu', 'Penseur', 'Shaman']}
]

var availableNamesPool = NAMES_POOL.duplicate(true)
var availableProfessionsPool = PROFESSIONS_POOL.duplicate(true)

var pullAncestorAct1 = []
var pullAncestorAct2 = []
var pullAncestorAct3 = []
var pullAncestorAct4 = []
var pullAncestorAct5 = []

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(pools.size()):
		for j in 10:
			generateAncestor(i)

func generateAncestor(poolIndex):
	var ancestor = load('res://Scenes/Power-ups/Ancestors/Ancestor.tscn').instance()
	var act = pools[poolIndex]
	
	ancestor.set_act(act)
	ancestor.set_name(generate_name(act)) # TODO : Generate name randomly according to seed
	ancestor.set_profession(generate_profession(act)) # TODO : Generate profession randomly according to seed
	push_ancestor_to_pool(ancestor)

func push_ancestor_to_pool(ancestor):
	var act = ancestor.get_act()
	ancestor.display_ancestor_infos()
	match act:
		'act1': pullAncestorAct1.append(ancestor)
		'act2': pullAncestorAct2.append(ancestor)
		'act3': pullAncestorAct3.append(ancestor)
		'act4': pullAncestorAct4.append(ancestor)
		'act5': pullAncestorAct5.append(ancestor)
		
func generate_name(act):
	var availableNames = ['Default']
	var actIndex
	for i in range(availableNamesPool.size()):
		if availableNamesPool[i].has(act):
			availableNames = availableNamesPool[i][act]
			actIndex = i
	var randomIndex = seeding.rng.randi_range(0, availableNames.size() - 1)
	var selectedName = availableNames[randomIndex]
	
	availableNamesPool[actIndex][act].pop_at(randomIndex)
	if (availableNamesPool[actIndex][act].size() == 0):
		availableNamesPool[actIndex][act] = NAMES_POOL[actIndex][act].duplicate()
		
	return selectedName
	
func generate_profession(act):
	var availableProfessions = []
	var actIndex
	
	for i in range(availableProfessionsPool.size()):
		if availableProfessionsPool[i].has(act):
			availableProfessions = availableProfessionsPool[i][act]
			actIndex = i
			
	var selectedProfessionName
	if (availableProfessionsPool[actIndex][act].size() == 0):
		selectedProfessionName = 'Chomeur'
	else:
		var randomIndex = seeding.rng.randi_range(0, availableProfessions.size() - 1)
		selectedProfessionName = availableProfessions[randomIndex]
		availableProfessionsPool[actIndex][act].pop_at(randomIndex)
	
	return selectedProfessionName

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
