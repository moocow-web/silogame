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
var time = 0
var spaced = 0
var spdLimit = 10000
const trailScene1 = preload("uid://b50xxm4xpukdk")
const trailScene2 = preload("uid://cf4ghvv1cma2v")
@onready var gui_2: RichTextLabel = $"../gui2"
@onready var gui: RichTextLabel = $"../gui"
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
	print(position.y)
	trun += 1
	time += 1
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
	if velocity.x > spdLimit:
		velocity.x = spdLimit
	if velocity.x < -spdLimit:
		velocity.x = -spdLimit
	if velocity.y < -spdLimit:
		velocity.y = -spdLimit
	if velocity.y > spdLimit:
		velocity.y = spdLimit
	if position.y < -20000 && spaced == 0:
		Auto.score += 200
		gui_2.text = "Space! \n +200 score"
		spaced = 1
		print("space!")
	if position.y > 0 && launched == 1:
		#Runs when dead
		Auto.score = gui.dis + (.2 * gui.dis) - (time / 20) + Auto.score
		get_tree().change_scene_to_file("res://home.tscn")
		
