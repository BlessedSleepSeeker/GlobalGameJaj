extends Panel


var familyNameLibelle = ''
var mainScene = load('res://Scenes/Main.tscn').instance()
var seeding

# Called when the node enters the scene tree for the first time.
func _ready():
	seeding = get_node("/root/Seeding")
	seeding.resetSeeds()

func _on_QuitGame_pressed():
	get_tree().quit()

func _on_StartGame_pressed():
	seeding.MAIN_SEED = familyNameLibelle
	seeding.generateSeeds()
	get_tree().root.call_deferred('add_child', mainScene)
	get_tree().root.call_deferred('remove_child', self)

func _on_FamilyName_text_changed(new_text):
	familyNameLibelle = new_text
