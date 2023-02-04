extends Panel

var ancestorButton1
var ancestorButton2
var ancestorButton3


# Called when the node enters the scene tree for the first time.
func _ready():
	ancestorButton1 = $AncestorButton
	ancestorButton2 = $AncestorButton2
	ancestorButton3 = $AncestorButton3
	ancestorButton1.fill_ancestor_button('Archibald Archicouille', 'Renifleur de café', 'Alcoolique', 'Fortiche')
	ancestorButton2.fill_ancestor_button('Jean Grojean', 'Ouvrier', 'Chétif', 'Charimatique')
	ancestorButton3.fill_ancestor_button('Ghislaine Amogus', 'Corsaire', 'Moche', 'Rapide')


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
