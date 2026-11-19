extends Area2D
const SLICE = preload("uid://bx3irw6xshatd")
const SLICE_2 = preload("uid://bbjt22h0vibu3")
var c
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position.x = -5000


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	c = randi_range(1, 4)
	if position.x < 20000000 && c == 1:
		position.x += 500
		var slice = SLICE.instantiate()
		slice.position = position
		add_sibling(slice)
	if position.x < 20000000 && c > 1:
		position.x += 500
		var slice = SLICE_2.instantiate()
		slice.position = position
		add_sibling(slice)
