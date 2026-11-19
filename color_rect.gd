extends ColorRect
var alt
@onready var cam: Camera2D = $"../Camera2D"
func _process(delta: float) -> void:
	alt = position.y + 2000 
	alt = alt / -20000
	alt = 1 - alt
	if alt <= 0.1:
		alt = 0.1
	position = cam.position
	position.x += -850
	position.y += -530
	color = Color(0.28, 0.67, 0.78, alt)
