extends Panel

var ancestorButton1
var ancestorButton2
var ancestorButton3


# Called when the node enters the scene tree for the first time.
func _ready():
	ancestorButton1 = $AncestorButton
	ancestorButton2 = $AncestorButton2
	ancestorButton3 = $AncestorButton3
	ancestorButton1.fill_ancestor_button('Archibald Archicouille', 'Renifleur de café', 'Vous êtes surexcités !', 'Alcoolique', "Allez-y doucement sur le vinrouje.", 'Fortiche', 'En voilà un beau six pack !')
	ancestorButton2.fill_ancestor_button('Jean Grojean', 'Ouvrier', 'Fabriquez des bonus temporaires !', 'Chétif', 'Peut-être est-il temps de se mettre au sport ?', 'Charimatique', 'Tout le monde vous aime !')
	ancestorButton3.fill_ancestor_button('Ghislaine Amogus', 'Corsaire', 'Aaaarhhh ! Tous aux canons !', 'Moche', "C'est la beauté de l'âme qui compte.", 'Rapide', 'Vous êtes véloces !')


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
