extends CharacterBody2D
var angular_velocity = 0
var fuel = 1000
var damp = .96 #out of 1, .96 is standard
var tr
var thrust = 0
var trun = 0
const trailScene1 = preload("uid://b50xxm4xpukdk")
const trailScene2 = preload("uid://cf4ghvv1cma2v")
func _physics_process(delta: float) -> void:
	velocity.y += 10
	thrust = 0
	angular_velocity = angular_velocity * damp
	if Input.is_action_pressed("ui_up"):
		velocity.y += -25 * cos(rotation) #calculates thrust
		velocity.x += 25 * sin(rotation)
		fuel += -1
		thrust = 1
	if Input.is_action_pressed("ui_left"):
		angular_velocity += -.005
	if Input.is_action_pressed("ui_right"):
		angular_velocity += .005
	rotation += angular_velocity
	tr = randi_range(1,2)
	if tr == 1 && thrust == 1 && trun > 5:
		var trail = trailScene1.instantiate()
		trail.position = Vector2(position.x, position.y)
		add_sibling(trail)
		trun = 0
	if tr == 2 && thrust == 1 && trun > 5:
		var trail = trailScene2.instantiate()
		trail.position = Vector2(position.x, position.y)
		add_sibling(trail)
		trun = 0
	print(velocity, trun)
	trun += 1
	move_and_slide()
	if velocity.x > 0:
		velocity.x += -4
	if velocity.x < 0:
		velocity.x += 4
	if velocity.y > 0:
		velocity.y += -4
	if velocity.y < 0:
		velocity.y += 4
	if velocity.x > 4000:
		velocity.x = 4000
	if velocity.x < -4000:
		velocity.x = -4000
	if velocity.y < -4000:
		velocity.y = -4000
	if velocity.y > 4000:
		velocity.y = 1000
