extends Area2D
func _ready() -> void:
	position.x = randi_range(1, 1000000)
func _process(delta: float) -> void:
	pass
#	print(position.x)
