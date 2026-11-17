extends ColorRect
var alt
@onready var cam: Camera2D = $"../Camera2D"
func _process(delta: float) -> void:
	alt = position.y / -10000
	alt = 1 - alt
	if alt <= 0.1:
		alt = 0.1
	position = cam.position
	position.x += -600
	position.y += -330
	color = Color(0.38, 0.77, 0.98, alt)
