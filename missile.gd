extends CharacterBody2D
var angular_velocity = 0
var fuel = 1000
const trailScene = preload("uid://b50xxm4xpukdk")
func _physics_process(delta: float) -> void:
	velocity.y += 20
	angular_velocity = angular_velocity * 0.98
	if Input.is_action_pressed("ui_up"):
		velocity.y += -100 * cos(rotation)
		velocity.x += 100 * sin(rotation)
		fuel += -1
	if Input.is_action_pressed("ui_left"):
		angular_velocity += -.005
	if Input.is_action_pressed("ui_right"):
		angular_velocity += .005
	rotation += angular_velocity
	var trail = trailScene.instantiate()
	trail.position = Vector2(position.x, position.y)
	add_sibling(trail)
	print("Fuel: ", round(fuel), " X: ", round(position.x), " Y: " , round(position.y), " Angle: ", round(rotation), " X Velocoity: ", round(velocity.x), " Y Velocoity: ", round(velocity.y))
	move_and_slide()
