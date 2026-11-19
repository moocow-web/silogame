extends RichTextLabel
var time = 0
@onready var missile: CharacterBody2D = $"../missile"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x = missile.position.x - 800
	position.y = missile.position.y - 400
	time += 1
	if time > 200:
		text = str(" ")
		time = 0
