extends Button

var nameLabel
var profession
var professionDesc
var traitN
var traitNDesc
var traitP
var traitPDesc

var ancestorName = 'Archibald Archicouille'
var professionName = 'Renifleur de café'

# Called when the node enters the scene tree for the first time.
func _ready():
	nameLabel = $Name
	profession = $Profession
	professionDesc = $ProfessionDescription
	traitN = $TraitN
	traitNDesc = $TraitNDescription
	traitP = $TraitP
	traitPDesc = $TraitPDescription

func fill_ancestor_button(nameStr, professionStr, professionDescStr, traitPStr, traitPDescStr, traitNStr, traitNDescStr):
	nameLabel.text = nameStr
	profession.text = professionStr
	professionDesc.text = professionDescStr
	traitN.text = traitNStr
	traitNDesc.text = traitNDescStr
	traitP.text = traitPStr
	traitPDesc.text = traitPDescStr
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
