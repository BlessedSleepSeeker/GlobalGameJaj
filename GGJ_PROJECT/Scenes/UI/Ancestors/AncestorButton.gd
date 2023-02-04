extends Button

var nameLabel
var professionAndTraitsLabel

var ancestorName = 'Archibald Archicouille'
var profession = 'Renifleur de café\tAlcoolique\tFortiche'

# Called when the node enters the scene tree for the first time.
func _ready():
	nameLabel = $Name
	professionAndTraitsLabel = $ProfessionAndTraits

func fill_ancestor_button(nameStr, profession, traitP, traitN):
	nameLabel.text = nameStr
	professionAndTraitsLabel.text = '%s    %s    %s' % [profession, traitP, traitN]
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
