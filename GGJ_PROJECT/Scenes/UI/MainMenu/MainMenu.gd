extends Panel


var familyNameLibelle = ''
var mainScene = load('res://Scenes/Main.tscn').instance()
var seeding
var playerVariables

# Called when the node enters the scene tree for the first time.
func _ready():
	seeding = get_node("/root/Seeding")
	seeding.resetSeeds()
	playerVariables = get_node("/root/PlayerVariables")
	playerVariables.reset_values()

func _on_QuitGame_pressed():
	get_tree().quit()

func _on_StartGame_pressed():
	seeding.MAIN_SEED = familyNameLibelle
	seeding.generateSeeds()
	get_tree().root.call_deferred('add_child', mainScene)
	get_tree().root.call_deferred('remove_child', self)

func _on_FamilyName_text_changed(new_text):
	familyNameLibelle = new_text
