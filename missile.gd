extends CharacterBody2D
var angular_velocity = 0
var fuel = 1000
var damp = .96 #out of 1, .96 is standard
const trailScene = preload("uid://b50xxm4xpukdk")
func _physics_process(delta: float) -> void:
	velocity.y += 20
	angular_velocity = angular_velocity * damp
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
	print(position.x)
	move_and_slide()
