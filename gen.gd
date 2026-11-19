extends Area2D
const SLICE = preload("uid://bx3irw6xshatd")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if position.x < 20000000:
		position.x += 500
		var slice = SLICE.instantiate()
		slice.position = position
		add_sibling(slice)
