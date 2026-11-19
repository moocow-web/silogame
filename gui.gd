extends RichTextLabel
@onready var missile: CharacterBody2D = $"../missile"
@onready var target: Area2D = $"../target"
var dis = 1
func _process(delta: float) -> void:
	position.x = missile.position.x + 300
	position.y = missile.position.y - 300
	dis = snapped((target.position.x - missile.position.x) / 100, 1)
	text = str("Distance from SILO: ", snapped(missile.position.x / 100, .1), "\nAltitude: ", snapped(missile.position.y / -100, .1), "\nDistance from target: ", snapped((target.position.x - missile.position.x) / 100, .1))
