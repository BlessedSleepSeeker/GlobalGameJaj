extends TextureRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export(Texture) var text_full
export(Texture) var text_empty


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func fill():
	texture = text_full

func empty():
	texture = text_empty
