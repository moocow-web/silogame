extends Area2D
var time = 0
func _physics_process(delta: float) -> void:
	time += 1
	if time >= 150:
		queue_free()
