extends CharacterBody2D
# -------------------------------------------
# definitions
# -------------------------------------------
var angular_velocity = 0
var fuel = 1000
var damp = .96 #out of 1, .96 is standard
var tr
var tx
var ty
var thrust = 0
var trun = 0
var launched = 0
const trailScene1 = preload("uid://b50xxm4xpukdk")
const trailScene2 = preload("uid://cf4ghvv1cma2v")
func _physics_process(delta: float) -> void:
	# -------------------------------------------
	# Gravity
	# -------------------------------------------
	if launched == 1:
		velocity.y += 10
	thrust = 0
	angular_velocity = angular_velocity * damp
	if Input.is_action_pressed("ui_accept") && launched == 0:
		velocity.y += -2000
		launched = 1
	# -------------------------------------------
	# Trigonometry (booo :( )
	# -------------------------------------------
	if Input.is_action_pressed("ui_up") && launched == 1:
		velocity.y += -25 * cos(rotation) #calculates thrust direction
		velocity.x += 25 * sin(rotation)
		fuel += -1
		thrust = 1
	if Input.is_action_pressed("ui_left") && launched == 1:
		angular_velocity += -.005
	if Input.is_action_pressed("ui_right") && launched == 1:
		angular_velocity += .005
	rotation += angular_velocity
	# -------------------------------------------
	# Trail
	# -------------------------------------------
	tr = randi_range(1, 2)
	if tr == 1 && thrust == 1 && trun > 5:
		var trail = trailScene1.instantiate()
		ty = 60 * cos(rotation)
		tx = -60 * sin(rotation)
		trail.position = Vector2(position.x + tx, position.y + ty)
		add_sibling(trail)
		trun = 0
	if tr == 2 && thrust == 1 && trun > 5:
		var trail = trailScene2.instantiate()
		ty = 60 * cos(rotation) 
		tx = -60 * sin(rotation)
		trail.position = Vector2(position.x + tx, position.y + ty)
		add_sibling(trail)
		trun = 0
	# -------------------------------------------
	# debug
	# -------------------------------------------
	print(velocity, trun)
	trun += 1
	move_and_slide()
	# -------------------------------------------
	# Checks
	# -------------------------------------------
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
	if position.y > 0 && launched == 1:
		#Runs when dead
		print("bleh")
