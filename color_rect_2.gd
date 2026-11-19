extends ColorRect
var alt
@onready var cam: Camera2D = $"../Camera2D"
func _process(delta: float) -> void:
	alt = position.y / 1000
	position = cam.position
	position.x += -850
	position.y += -530
	color = Color(0, 0, 0, 1)
